#!/usr/bin/env python3
"""Create Graphviz visualizations from a structural gate-level Verilog netlist.

The script is intentionally dependency-light: it parses simple structural Verilog
instances directly, emits DOT, and optionally calls Graphviz `dot` to render SVG,
PNG, or PDF.  When a UPSET report directory is provided, per-gate ASET/APW values
from `apw_gatepins_mapped.csv` (or compatible CSVs) are included in node labels
and used for heatmap coloring.
"""

from __future__ import annotations

import argparse
import csv
import math
import re
import shutil
import subprocess
import sys
from collections import deque
from pathlib import Path
from typing import Iterable


SCRIPT_DIR = Path(__file__).resolve().parent
WORKSPACE_DIR = SCRIPT_DIR.parent
DEFAULT_VERILOG = WORKSPACE_DIR / "testcases" / "iscas85" / "c1908" / "c1908.v"
DEFAULT_REPORTS_ROOT = WORKSPACE_DIR / "reports" / "c1908"
DEFAULT_OUT_DIR = WORKSPACE_DIR / "netlist_graphs"

OUTPUT_PINS = {
    "Y",
    "Q",
    "Q_N",
    "QN",
    "X",
    "Z",
    "ZN",
    "CO",
    "S",
    "SO",
    "GCLK",
    "L_LO",
    "L_HI",
}


class Instance:
    def __init__(self, name: str, cell: str, pins: dict[str, str]):
        self.name = name
        self.cell = cell
        self.pins = pins

    @property
    def output_pins(self) -> list[tuple[str, str]]:
        return [(pin, net) for pin, net in self.pins.items() if is_output_pin(pin)]

    @property
    def input_pins(self) -> list[tuple[str, str]]:
        return [(pin, net) for pin, net in self.pins.items() if not is_output_pin(pin)]


class Design:
    def __init__(
        self,
        top_module: str,
        inputs: set[str],
        outputs: set[str],
        wires: set[str],
        instances: dict[str, Instance],
    ):
        self.top_module = top_module
        self.inputs = inputs
        self.outputs = outputs
        self.wires = wires
        self.instances = instances
        self.net_drivers: dict[str, tuple[str, str]] = {}
        self.net_loads: dict[str, list[tuple[str, str]]] = {}
        self.edges: list[tuple[str, str, str, str, str]] = []
        self._index_connectivity()

    def _index_connectivity(self) -> None:
        for inst in self.instances.values():
            for pin, net in inst.output_pins:
                self.net_drivers.setdefault(net, (inst.name, pin))
            for pin, net in inst.input_pins:
                self.net_loads.setdefault(net, []).append((inst.name, pin))

        for net, (src_gate, src_pin) in self.net_drivers.items():
            for dst_gate, dst_pin in self.net_loads.get(net, []):
                self.edges.append((src_gate, src_pin, dst_gate, dst_pin, net))


class GateMetric:
    def __init__(
        self,
        gate: str,
        pin: str = "",
        node: str = "",
        cell: str = "",
        aset: float | None = None,
        apw: float | None = None,
        latched_aset: float | None = None,
        worst_mpw: float | None = None,
        related_set_scenarios: str = "",
    ):
        self.gate = gate
        self.pin = pin
        self.node = node
        self.cell = cell
        self.aset = aset
        self.apw = apw
        self.latched_aset = latched_aset
        self.worst_mpw = worst_mpw
        self.related_set_scenarios = related_set_scenarios

    def metric_value(self, metric_name: str) -> float | None:
        return getattr(self, metric_name, None)


class Metrics:
    def __init__(self, by_gate: dict[str, GateMetric], source: Path | None = None):
        self.by_gate = by_gate
        self.source = source

    @classmethod
    def empty(cls) -> "Metrics":
        return cls({})

    @classmethod
    def by_gate_rows(cls, rows: Iterable[dict[str, str]], source: Path | None = None) -> "Metrics":
        by_gate: dict[str, GateMetric] = {}
        for row in rows:
            gate = (row.get("gate") or row.get("GATE") or row.get("instance") or "").strip()
            if not gate:
                # Fall back to gate-like part of c1908/U222/X if present.
                name = (row.get("GATEPIN NAME") or row.get("original_name") or "").strip()
                parts = [p for p in name.split("/") if p]
                if len(parts) >= 2:
                    gate = parts[-2]
            if not gate:
                continue

            metric = GateMetric(
                gate=gate,
                pin=(row.get("pin") or row.get("PIN") or "").strip(),
                node=(row.get("node") or row.get("local_name") or row.get("GATEPIN NAME") or "").strip(),
                cell=(row.get("cell") or row.get("CELL") or "").strip(),
                aset=parse_float(row.get("aset") or row.get("ASET")),
                apw=parse_float(row.get("apw") or row.get("APW")),
                latched_aset=parse_float(row.get("latched_aset") or row.get("LATCHED_ASET")),
                worst_mpw=parse_float(row.get("worst_mpw") or row.get("WORST_MPW")),
                related_set_scenarios=(row.get("related_set_scenarios") or "").strip(),
            )
            by_gate[gate] = metric
        return cls(by_gate, source=source)

    def max_value(self, metric_names: list[str], included_gates: set[str] | None = None) -> float:
        max_value = 0.0
        for gate, metric in self.by_gate.items():
            if included_gates is not None and gate not in included_gates:
                continue
            for name in metric_names:
                value = metric.metric_value(name)
                if value is not None and math.isfinite(value):
                    max_value = max(max_value, value)
        return max_value


def parse_float(value: str | None) -> float | None:
    if value is None or value == "":
        return None
    try:
        return float(value)
    except ValueError:
        return None


def is_output_pin(pin: str) -> bool:
    return pin in OUTPUT_PINS or pin.endswith("_OUT")


def strip_comments(text: str) -> str:
    text = re.sub(r"/\*.*?\*/", "", text, flags=re.S)
    text = re.sub(r"//.*", "", text)
    return text


def parse_declared_names(text: str, keyword: str) -> set[str]:
    names: set[str] = set()
    for match in re.finditer(rf"\b{keyword}\b\s+(.*?);", text, flags=re.S):
        decl = re.sub(r"\[[^\]]+\]", " ", match.group(1))
        for name in re.split(r"[,\s]+", decl):
            name = name.strip()
            if name:
                names.add(name)
    return names


def parse_verilog(path: str | Path) -> Design:
    path = Path(path)
    text = strip_comments(path.read_text(encoding="utf-8"))
    module_match = re.search(r"\bmodule\s+(\w+)\s*\(", text)
    if not module_match:
        raise ValueError(f"No Verilog module declaration found in {path}")
    top_module = module_match.group(1)
    inputs = parse_declared_names(text, "input")
    outputs = parse_declared_names(text, "output")
    wires = parse_declared_names(text, "wire")

    instances: dict[str, Instance] = {}
    inst_re = re.compile(r"\b(sg13g2_\w+)\s+(\w+)\s*\((.*?)\)\s*;", flags=re.S)
    for cell, name, pin_blob in inst_re.findall(text):
        pins: dict[str, str] = {}
        for pin, net in re.findall(r"\.(\w+)\s*\(\s*([^()\s,]+)\s*\)", pin_blob):
            pins[pin] = net
        if pins:
            instances[name] = Instance(name=name, cell=cell, pins=pins)
    if not instances:
        raise ValueError(f"No sg13g2_* standard-cell instances found in {path}")
    return Design(top_module, inputs, outputs, wires, instances)


def read_csv_rows(csv_path: Path) -> list[dict[str, str]]:
    with csv_path.open(newline="", encoding="utf-8-sig") as f:
        return list(csv.DictReader(f))


def load_metrics(report_or_csv: str | Path | None) -> Metrics:
    if report_or_csv is None:
        return Metrics.empty()
    path = Path(report_or_csv)
    if path.is_dir():
        candidates = [
            path / "apw_gatepins_mapped.csv",
            path / "aset_gatepins_mapped.csv",
            path / "aset_gatepins_sorted.csv",
            path / "set_gatepins.csv",
        ]
        csv_path = next((p for p in candidates if p.exists()), None)
        if csv_path is None:
            raise FileNotFoundError(
                f"No compatible metric CSV found in {path}; expected one of: "
                + ", ".join(p.name for p in candidates)
            )
    else:
        csv_path = path
    return Metrics.by_gate_rows(read_csv_rows(csv_path), source=csv_path)


def split_names(values: Iterable[str] | None) -> list[str]:
    names: list[str] = []
    for value in values or []:
        for part in value.split(","):
            part = part.strip()
            if part:
                names.append(part)
    return names


def select_cone(
    design: Design,
    focus_gates: Iterable[str] = (),
    focus_nets: Iterable[str] = (),
    levels_back: int = 0,
    levels_forward: int = 0,
) -> set[str]:
    selected: set[str] = set(g for g in focus_gates if g in design.instances)
    for net in focus_nets:
        if net in design.net_drivers:
            selected.add(design.net_drivers[net][0])
        for gate, _pin in design.net_loads.get(net, []):
            selected.add(gate)

    if not selected:
        return set(design.instances)

    reverse_adj: dict[str, set[str]] = {gate: set() for gate in design.instances}
    forward_adj: dict[str, set[str]] = {gate: set() for gate in design.instances}
    for src_gate, _src_pin, dst_gate, _dst_pin, _net in design.edges:
        forward_adj.setdefault(src_gate, set()).add(dst_gate)
        reverse_adj.setdefault(dst_gate, set()).add(src_gate)

    def walk(starts: set[str], adj: dict[str, set[str]], levels: int) -> set[str]:
        seen = set(starts)
        queue = deque((gate, 0) for gate in starts)
        while queue:
            gate, depth = queue.popleft()
            if depth >= levels:
                continue
            for nxt in adj.get(gate, set()):
                if nxt not in seen:
                    seen.add(nxt)
                    queue.append((nxt, depth + 1))
        return seen

    return walk(selected, reverse_adj, levels_back) | walk(selected, forward_adj, levels_forward)


def compute_gate_levels(design: Design) -> dict[str, int]:
    """Return topological logic depth for each gate, starting at 0 near inputs."""
    predecessors: dict[str, set[str]] = {gate: set() for gate in design.instances}
    successors: dict[str, set[str]] = {gate: set() for gate in design.instances}
    for src_gate, _src_pin, dst_gate, _dst_pin, _net in design.edges:
        successors.setdefault(src_gate, set()).add(dst_gate)
        predecessors.setdefault(dst_gate, set()).add(src_gate)

    levels = {gate: 0 for gate in design.instances}
    indegree = {gate: len(predecessors.get(gate, set())) for gate in design.instances}
    queue = deque(sorted((gate for gate, degree in indegree.items() if degree == 0), key=natural_key))
    visited: set[str] = set()

    while queue:
        gate = queue.popleft()
        visited.add(gate)
        for successor in sorted(successors.get(gate, set()), key=natural_key):
            levels[successor] = max(levels[successor], levels[gate] + 1)
            indegree[successor] -= 1
            if indegree[successor] == 0:
                queue.append(successor)

    if len(visited) != len(design.instances):
        # Unexpected cycles should not make visualization fail. Keep already
        # resolved levels and conservatively place cyclic/unresolved gates after
        # their known predecessors when possible.
        for gate in sorted((set(design.instances) - visited), key=natural_key):
            pred_levels = [levels[pred] for pred in predecessors.get(gate, set()) if pred in levels]
            levels[gate] = (max(pred_levels) + 1) if pred_levels else 0
    return levels


def escape_label(value: object) -> str:
    return str(value).replace("\\", "\\\\").replace('"', r'\"').replace("\n", r"\n")


def fmt_metric(value: float | None) -> str:
    if value is None:
        return "-"
    return f"{value:.4g}"


def heat_color(value: float | None, max_value: float) -> str:
    if value is None or max_value <= 0:
        return "#f7f7f7"
    ratio = max(0.0, min(1.0, value / max_value))
    # White/yellow -> orange -> red heatmap.
    if ratio < 0.5:
        t = ratio / 0.5
        r, g, b = 255, int(255 - 80 * t), int(230 - 170 * t)
    else:
        t = (ratio - 0.5) / 0.5
        r, g, b = 255, int(175 - 105 * t), int(60 - 40 * t)
    return f"#{r:02x}{g:02x}{b:02x}"


def gate_metric_for_color(metric: GateMetric | None, color_by: str) -> float | None:
    if metric is None:
        return None
    if color_by == "max":
        values = [v for v in (metric.aset, metric.apw) if v is not None]
        return max(values) if values else None
    return metric.metric_value(color_by)


def build_gate_label(inst: Instance, metric: GateMetric | None, show_pin_nets: bool) -> str:
    lines = [inst.name, inst.cell]
    output_bits = [f"{pin}={net}" for pin, net in inst.output_pins]
    if output_bits:
        lines.append("out: " + ", ".join(output_bits))
    if metric is not None:
        lines.append(f"ASET={fmt_metric(metric.aset)}  APW={fmt_metric(metric.apw)}")
        if metric.worst_mpw is not None or metric.related_set_scenarios:
            lines.append(
                f"MPW={fmt_metric(metric.worst_mpw)}  scenarios={metric.related_set_scenarios or '-'}"
            )
    if show_pin_nets:
        input_bits = [f"{pin}={net}" for pin, net in inst.input_pins]
        if input_bits:
            lines.append("in: " + ", ".join(input_bits))
    return "\n".join(lines)


def build_dot(
    design: Design,
    metrics: Metrics | None = None,
    focus_gates: Iterable[str] = (),
    focus_nets: Iterable[str] = (),
    levels_back: int = 0,
    levels_forward: int = 0,
    show_ports: bool = False,
    show_pin_nets: bool = False,
    color_by: str = "max",
    highlight_gates: Iterable[str] = (),
    rankdir: str = "LR",
    splines: str = "ortho",
    edge_labels: str = "xlabel",
    nodesep: float = 0.55,
    ranksep: float = 1.0,
    levelize: bool = True,
) -> str:
    metrics = metrics or Metrics.empty()
    focus_gate_list = split_names(focus_gates)
    focus_net_list = split_names(focus_nets)
    selected = select_cone(design, focus_gate_list, focus_net_list, levels_back, levels_forward)
    highlight = set(split_names(highlight_gates)) | set(focus_gate_list)
    color_metrics = ["aset", "apw"] if color_by == "max" else [color_by]
    max_metric = metrics.max_value(color_metrics, included_gates=selected)

    lines: list[str] = []
    lines.append("digraph netlist {")
    lines.append(
        f"  graph [rankdir={rankdir}, bgcolor=white, splines={splines}, "
        f"outputorder=edgesfirst, overlap=false, concentrate=true, pack=true, "
        f"nodesep={nodesep}, ranksep={ranksep}];"
    )
    lines.append('  node [shape=box, style="rounded,filled", fontname="Helvetica", fontsize=10, margin="0.08,0.05"];')
    lines.append('  edge [fontname="Helvetica", fontsize=8, color="#555555", arrowsize=0.7, penwidth=1.1];')
    title = f"{design.top_module}: {len(selected)}/{len(design.instances)} gates"
    if metrics.source:
        title += f" | metrics: {metrics.source}"
    lines.append(f'  label="{escape_label(title)}";')
    lines.append("  labelloc=t;")

    for gate in sorted(selected, key=lambda g: natural_key(g)):
        inst = design.instances[gate]
        metric = metrics.by_gate.get(gate)
        color_value = gate_metric_for_color(metric, color_by)
        fill = heat_color(color_value, max_metric)
        border = "#0b7d2b" if gate in highlight else "#333333"
        penwidth = "3" if gate in highlight else "1"
        label = build_gate_label(inst, metric, show_pin_nets=show_pin_nets)
        lines.append(
            f'  "{escape_label(gate)}" [label="{escape_label(label)}", fillcolor="{fill}", color="{border}", penwidth={penwidth}];'
        )

    if levelize:
        gate_levels = compute_gate_levels(design)
        selected_by_level: dict[int, list[str]] = {}
        for gate in selected:
            selected_by_level.setdefault(gate_levels.get(gate, 0), []).append(gate)
        for _level, gates in sorted(selected_by_level.items()):
            ranked_gates = "; ".join(f'"{escape_label(gate)}"' for gate in sorted(gates, key=natural_key))
            lines.append(f"  {{ rank=same; {ranked_gates}; }}")

    if show_ports:
        nets_to_show = set()
        for gate in selected:
            inst = design.instances[gate]
            for _pin, net in inst.input_pins + inst.output_pins:
                if net in design.inputs or net in design.outputs:
                    nets_to_show.add(net)
        for net in sorted(nets_to_show, key=natural_key):
            shape = "invhouse" if net in design.inputs else "house"
            fill = "#d7ecff" if net in design.inputs else "#dcf8d7"
            lines.append(f'  "port:{escape_label(net)}" [label="{escape_label(net)}", shape={shape}, fillcolor="{fill}"];')

    emitted_edges: set[tuple[str, str, str]] = set()
    for src_gate, src_pin, dst_gate, dst_pin, net in sorted(design.edges, key=lambda e: (natural_key(e[0]), natural_key(e[2]), e[4])):
        if src_gate in selected and dst_gate in selected:
            key = (src_gate, dst_gate, net)
            if key not in emitted_edges:
                emitted_edges.add(key)
                attrs = edge_attrs(
                    f"{escape_label(net)}\\n{escape_label(src_pin)}→{escape_label(dst_pin)}",
                    edge_labels,
                )
                lines.append(
                    f'  "{escape_label(src_gate)}" -> "{escape_label(dst_gate)}" '
                    f'[{attrs}];'
                )

    if show_ports:
        for gate in sorted(selected, key=natural_key):
            inst = design.instances[gate]
            for dst_pin, net in inst.input_pins:
                if net in design.inputs:
                    attrs = edge_attrs(
                        f"{escape_label(net)}\\n→{escape_label(dst_pin)}",
                        edge_labels,
                        extra='color="#337ab7"',
                    )
                    lines.append(
                        f'  "port:{escape_label(net)}" -> "{escape_label(gate)}" '
                        f'[{attrs}];'
                    )
            for src_pin, net in inst.output_pins:
                if net in design.outputs:
                    attrs = edge_attrs(
                        f"{escape_label(net)}\\n{escape_label(src_pin)}→",
                        edge_labels,
                        extra='color="#3c763d"',
                    )
                    lines.append(
                        f'  "{escape_label(gate)}" -> "port:{escape_label(net)}" '
                        f'[{attrs}];'
                    )

    lines.append("}")
    return "\n".join(lines) + "\n"


def edge_attrs(label: str, edge_labels: str, extra: str = "") -> str:
    attrs: list[str] = []
    if edge_labels == "label":
        attrs.append(f'label="{label}"')
    elif edge_labels == "xlabel":
        # Graphviz warns that orthogonal splines do not handle normal edge
        # labels well. xlabels keep the Manhattan wires cleaner while still
        # showing net/pin names near the edge.
        attrs.append(f'xlabel="{label}"')
    elif edge_labels != "none":
        raise ValueError(f"Unsupported edge_labels mode: {edge_labels}")
    if extra:
        attrs.append(extra)
    return ", ".join(attrs)


def natural_key(value: object):
    return [int(part) if part.isdigit() else part for part in re.split(r"(\d+)", str(value))]


def list_report_dirs(reports_root: Path) -> list[Path]:
    if not reports_root.exists():
        return []
    dirs = [p for p in reports_root.iterdir() if p.is_dir() and any((p / name).exists() for name in ("apw_gatepins_mapped.csv", "aset_gatepins_mapped.csv", "set_gatepins.csv"))]
    return sorted(dirs, key=lambda p: p.name)


def prompt_for_report_dir(reports_root: Path) -> Path | None:
    dirs = list_report_dirs(reports_root)
    if not dirs:
        print(f"No report directories with metric CSVs found under {reports_root}", file=sys.stderr)
        return None
    print("Available report directories:")
    for idx, path in enumerate(dirs, start=1):
        print(f"  {idx:2d}) {path.name}")
    while True:
        answer = input("Select report directory number, full path, or blank for no metrics: ").strip()
        if not answer:
            return None
        if answer.isdigit() and 1 <= int(answer) <= len(dirs):
            return dirs[int(answer) - 1]
        candidate = Path(answer)
        if candidate.exists():
            return candidate
        print("Invalid selection; try again.")


def prompt_for_focus() -> tuple[list[str], list[str], int, int]:
    gates = split_names([input("Focus gates, comma-separated (blank = full circuit): ").strip()])
    nets = split_names([input("Focus nets, comma-separated (blank = none): ").strip()])
    def ask_int(label: str, default: int) -> int:
        answer = input(f"{label} [{default}]: ").strip()
        if not answer:
            return default
        return int(answer)
    levels_back = ask_int("Levels backward from focus", 2 if gates or nets else 0)
    levels_forward = ask_int("Levels forward from focus", 2 if gates or nets else 0)
    return gates, nets, levels_back, levels_forward


def render_dot(dot_path: Path, out_path: Path, fmt: str) -> None:
    dot_bin = shutil.which("dot")
    if not dot_bin:
        raise RuntimeError(
            "Graphviz 'dot' was not found. Install graphviz, or use --dot-only and render the .dot file elsewhere."
        )
    subprocess.run([dot_bin, f"-T{fmt}", str(dot_path), "-o", str(out_path)], check=True)


def parse_args(argv: list[str] | None = None):
    parser = argparse.ArgumentParser(
        description="Visualize a structural gate-level Verilog netlist with optional UPSET ASET/APW heatmap labels.",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )
    parser.add_argument("--verilog", default=str(DEFAULT_VERILOG), help="Gate-level Verilog netlist.")
    parser.add_argument("--reports-dir", default=None, help="UPSET report directory containing apw_gatepins_mapped.csv/aset_gatepins_mapped.csv/set_gatepins.csv.")
    parser.add_argument("--metrics-csv", default=None, help="Explicit metric CSV path; overrides --reports-dir.")
    parser.add_argument("--reports-root", default=str(DEFAULT_REPORTS_ROOT), help="Root used by --prompt to list report directories.")
    parser.add_argument("--prompt", action="store_true", help="Interactively ask for report directory and focus cone options.")
    parser.add_argument("--focus-gate", action="append", default=[], help="Gate(s) to focus on. May be repeated or comma-separated, e.g. U222,U241.")
    parser.add_argument("--focus-net", action="append", default=[], help="Net(s) to focus on. May be repeated or comma-separated, e.g. N2891,n222.")
    parser.add_argument("--levels-back", type=int, default=0, help="Number of predecessor gate levels to include around focus.")
    parser.add_argument("--levels-forward", type=int, default=0, help="Number of successor gate levels to include around focus.")
    parser.add_argument("--highlight-gate", action="append", default=[], help="Gate(s) to draw with a thick green border. May be repeated or comma-separated.")
    parser.add_argument("--show-ports", action="store_true", help="Show primary input/output port nodes when connected to included gates.")
    parser.add_argument("--show-pin-nets", action="store_true", help="Include all input pin/net mappings in each gate label. Useful but verbose.")
    parser.add_argument("--color-by", choices=["max", "aset", "apw", "latched_aset", "worst_mpw"], default="max", help="Metric used for heatmap fill color.")
    parser.add_argument("--rankdir", choices=["LR", "TB", "RL", "BT"], default="LR", help="Graph layout direction.")
    parser.add_argument("--splines", choices=["ortho", "polyline", "line", "curved", "spline", "true", "false"], default="ortho", help="Edge routing style. Use ortho for squared circuit-like wires; polyline is a useful fallback if labels overlap.")
    parser.add_argument("--edge-labels", choices=["xlabel", "label", "none"], default="xlabel", help="How to draw net/pin names on edges. xlabel works better with --splines ortho.")
    parser.add_argument("--nodesep", type=float, default=0.55, help="Horizontal spacing between nodes in the same rank.")
    parser.add_argument("--ranksep", type=float, default=1.0, help="Spacing between ranks/logic levels.")
    levelize_group = parser.add_mutually_exclusive_group()
    levelize_group.add_argument(
        "--levelize",
        dest="levelize",
        action="store_true",
        help="Force gates at the same computed logic depth into the same Graphviz rank.",
    )

    levelize_group.add_argument(
        "--no-levelize",
        dest="levelize",
        action="store_false",
        help="Let Graphviz place gates freely instead of forcing logic-depth ranks.",
    )

    parser.set_defaults(levelize=True)
    parser.add_argument("--format", choices=["svg", "png", "pdf"], default="svg", help="Rendered output format.")
    parser.add_argument("--out", default=None, help="Rendered image path. Default: workspace/netlist_graphs/<top>_<scope>.<format>.")
    parser.add_argument("--dot-out", default=None, help="DOT output path. Default: same as --out with .dot suffix.")
    parser.add_argument("--dot-only", action="store_true", help="Only write DOT; do not invoke Graphviz.")
    return parser.parse_args(argv)


def default_output_path(design: Design, args, focus_gates: list[str], focus_nets: list[str]) -> Path:
    DEFAULT_OUT_DIR.mkdir(parents=True, exist_ok=True)
    if focus_gates or focus_nets:
        scope = "cone_" + "_".join(focus_gates + focus_nets)
    else:
        scope = "full"
    safe_scope = re.sub(r"[^A-Za-z0-9_.-]+", "_", scope)
    return DEFAULT_OUT_DIR / f"{design.top_module}_{safe_scope}.{args.format}"


def main(argv: list[str] | None = None) -> int:
    args = parse_args(argv)
    design = parse_verilog(args.verilog)

    report_source: str | Path | None = args.metrics_csv or args.reports_dir
    focus_gates = split_names(args.focus_gate)
    focus_nets = split_names(args.focus_net)
    levels_back = args.levels_back
    levels_forward = args.levels_forward

    if args.prompt:
        if report_source is None:
            selected_report = prompt_for_report_dir(Path(args.reports_root))
            report_source = selected_report
        if not focus_gates and not focus_nets:
            focus_gates, focus_nets, levels_back, levels_forward = prompt_for_focus()

    metrics = load_metrics(report_source)
    out_path = Path(args.out) if args.out else default_output_path(design, args, focus_gates, focus_nets)
    dot_path = Path(args.dot_out) if args.dot_out else out_path.with_suffix(".dot")
    out_path.parent.mkdir(parents=True, exist_ok=True)
    dot_path.parent.mkdir(parents=True, exist_ok=True)

    dot = build_dot(
        design,
        metrics=metrics,
        focus_gates=focus_gates,
        focus_nets=focus_nets,
        levels_back=levels_back,
        levels_forward=levels_forward,
        show_ports=args.show_ports,
        show_pin_nets=args.show_pin_nets,
        color_by=args.color_by,
        highlight_gates=args.highlight_gate,
        rankdir=args.rankdir,
        splines=args.splines,
        edge_labels=args.edge_labels,
        nodesep=args.nodesep,
        ranksep=args.ranksep,
        levelize=args.levelize,
    )
    dot_path.write_text(dot, encoding="utf-8")
    print(f"Wrote DOT: {dot_path}")

    if args.dot_only:
        return 0
    render_dot(dot_path, out_path, args.format)
    print(f"Wrote {args.format.upper()}: {out_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
