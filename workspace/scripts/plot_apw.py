#!/usr/bin/env python3
"""Visualize UPSET gatepin accumulated pulse width (APW) results."""

from __future__ import annotations

import argparse
import csv
import re
import sys
from pathlib import Path



SCRIPT_DIR = Path(__file__).resolve().parent
WORKSPACE_DIR = SCRIPT_DIR.parent
DEFAULT_VERILOG = WORKSPACE_DIR / "testcases" / "iscas85" / "c1908" / "c1908.v"
DEFAULT_REPORTS_ROOT = WORKSPACE_DIR / "reports" / "c1908"

OUTPUT_PINS = {
    "Y", "Q", "Q_N", "X", "Z", "GCLK", "L_LO", "L_HI"
}


def parse_args():
    parser = argparse.ArgumentParser(
        description=(
            "Visualize UPSET gatepin APW (accumulated pulse width) results "
            "and map nets to driver gates."
        )
    )
    parser.add_argument(
        "csv_file",
        nargs="?",
        default=None,
        help=(
            "Path to set_gatepins.csv. If omitted, prompt for one of "
            "reports/c1908/<experiment>/set_gatepins.csv."
        ),
    )
    parser.add_argument(
        "--verilog",
        default=str(DEFAULT_VERILOG),
        help=(
            "Path to gate-level Verilog netlist. "
            f"Default: {DEFAULT_VERILOG}"
        ),
    )
    parser.add_argument(
        "--reports-root",
        default=str(DEFAULT_REPORTS_ROOT),
        help=(
            "Reports root used when csv_file is omitted. "
            f"Default: {DEFAULT_REPORTS_ROOT}"
        ),
    )
    parser.add_argument(
        "--top",
        type=int,
        default=25,
        help="Number of top APW entries to plot.",
    )
    parser.add_argument(
        "--min-apw",
        type=float,
        default=0.0,
        help="Minimum APW value to include.",
    )
    parser.add_argument(
        "--ascending",
        action="store_true",
        help="Sort APW in ascending order. Default is descending.",
    )
    parser.add_argument(
        "--out-png",
        default=None,
        help="Output PNG plot path. Default: <csv directory>/apw_gatepins.png",
    )
    parser.add_argument(
        "--out-csv",
        default=None,
        help="Output mapped CSV path. Default: <csv directory>/apw_gatepins_mapped.csv",
    )
    return parser.parse_args()


def find_report_csvs(reports_root: Path) -> list[Path]:
    if not reports_root.exists():
        raise FileNotFoundError(f"Reports root not found: {reports_root}")

    csvs = []
    for report_dir in sorted(reports_root.iterdir()):
        if not report_dir.is_dir():
            continue
        if report_dir.name in {"plots", "__pycache__"} or report_dir.name.startswith("."):
            continue
        csv_path = report_dir / "set_gatepins.csv"
        if csv_path.exists():
            csvs.append(csv_path)
    return csvs


def prompt_for_csv(reports_root: Path) -> Path:
    csvs = find_report_csvs(reports_root)
    if not csvs:
        raise FileNotFoundError(
            f"No set_gatepins.csv files found under {reports_root}/<experiment>/"
        )

    print(f"Available c1908 SET gatepin reports under {reports_root}:")
    for idx, csv_path in enumerate(csvs, start=1):
        print(f"  {idx}) {csv_path.parent.name} ({csv_path})")

    while True:
        try:
            answer = input(f"Select report [1-{len(csvs)}]: ").strip()
        except EOFError as exc:
            raise RuntimeError(
                "csv_file was omitted, but stdin is not interactive. "
                "Pass an explicit set_gatepins.csv path."
            ) from exc

        if not answer:
            print("Please enter a number.")
            continue

        try:
            choice = int(answer)
        except ValueError:
            print(f"Invalid selection: {answer}")
            continue

        if 1 <= choice <= len(csvs):
            return csvs[choice - 1]

        print(f"Selection must be between 1 and {len(csvs)}.")


def clean_signal_name(signal: str) -> str:
    signal = signal.strip()
    signal = signal.replace("\\", "")
    return signal


def strip_hierarchy(name: str) -> str:
    """
    Converts:
      c1908/N2891 -> N2891
      c1908/U282/Y -> U282/Y
    """
    parts = name.strip().split("/")
    if len(parts) >= 2 and parts[-2].startswith("U"):
        return f"{parts[-2]}/{parts[-1]}"
    return parts[-1]


def parse_verilog_instances(verilog_path: Path):
    """
    Parses simple gate-level Verilog instances and builds driver maps.
    """
    text = verilog_path.read_text()

    # Remove line comments.
    text = re.sub(r"//.*", "", text)

    # Match gate-level instances. This assumes standard-cell instances.
    instance_re = re.compile(
        r"(?P<cell>\w+)\s+(?P<inst>\\?\w+)\s*\((?P<ports>.*?)\)\s*;",
        re.DOTALL,
    )

    port_re = re.compile(
        r"\.(?P<pin>\w+)\s*\(\s*(?P<net>[^)]+?)\s*\)",
        re.DOTALL,
    )

    driver_by_net = {}
    net_by_gatepin = {}

    for match in instance_re.finditer(text):
        cell = match.group("cell").strip()
        inst = clean_signal_name(match.group("inst"))
        ports_blob = match.group("ports")

        # Skip module declarations or non-standard-cell-looking entries.
        if inst.lower() in {"input", "output", "wire"}:
            continue

        for port_match in port_re.finditer(ports_blob):
            pin = port_match.group("pin").strip()
            net = clean_signal_name(port_match.group("net"))

            net_by_gatepin[f"{inst}/{pin}"] = net

            if pin in OUTPUT_PINS:
                driver_by_net[net] = {
                    "gate": inst,
                    "cell": cell,
                    "pin": pin,
                    "node": net,
                }

    return driver_by_net, net_by_gatepin


def parse_float(value: str) -> float:
    try:
        return float(value)
    except (TypeError, ValueError):
        return 0.0


def read_gatepin_csv(csv_path: Path, driver_by_net, net_by_gatepin):
    rows = []

    with csv_path.open("r", newline="") as f:
        reader = csv.DictReader(f)
        if reader.fieldnames is None:
            raise ValueError(f"CSV file has no header: {csv_path}")
        reader.fieldnames = [field.strip() for field in reader.fieldnames]

        for raw in reader:
            row = {k.strip(): v.strip() for k, v in raw.items()}

            gatepin_name = row["GATEPIN NAME"]
            local_name = strip_hierarchy(gatepin_name)
            apw = parse_float(row.get("APW", "0"))

            mapped = {
                "original_name": gatepin_name,
                "local_name": local_name,
                "gate": "",
                "cell": "",
                "pin": "",
                "node": "",
                "apw": apw,
                "aset": parse_float(row.get("ASET", "0")),
                "latched_aset": parse_float(row.get("Latched ASET", "0")),
                "worst_mpw": parse_float(row.get("Worst MPW", "0")),
                "related_set_scenarios": row.get("#Related SET Scenarios", ""),
                "reachable_endpoints": row.get("#Reachable Endpoints", ""),
            }

            if "/" in local_name:
                # Example: U282/Y
                gate, pin = local_name.split("/", 1)
                node = net_by_gatepin.get(local_name, "")

                mapped["gate"] = gate
                mapped["pin"] = pin
                mapped["node"] = node

                if node in driver_by_net:
                    mapped["cell"] = driver_by_net[node]["cell"]

            else:
                # Example: N2891
                node = local_name
                mapped["node"] = node

                if node in driver_by_net:
                    mapped["gate"] = driver_by_net[node]["gate"]
                    mapped["cell"] = driver_by_net[node]["cell"]
                    mapped["pin"] = driver_by_net[node]["pin"]

            rows.append(mapped)

    return rows


def write_mapped_csv(rows, out_csv: Path):
    out_csv.parent.mkdir(parents=True, exist_ok=True)

    fieldnames = [
        "original_name",
        "local_name",
        "gate",
        "cell",
        "pin",
        "node",
        "apw",
        "aset",
        "latched_aset",
        "worst_mpw",
        "related_set_scenarios",
        "reachable_endpoints",
    ]

    with out_csv.open("w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames, extrasaction="ignore")
        writer.writeheader()
        writer.writerows(rows)


def plot_top_apw(rows, out_png: Path, top_n: int, ascending: bool):
    selected = rows[:top_n]

    if not selected:
        print("No rows to plot.")
        return

    try:
        import matplotlib.pyplot as plt
    except ImportError as exc:
        raise RuntimeError(
            "matplotlib is required to write the PNG plot. "
            "Install it with: python3 -m pip install matplotlib"
        ) from exc

    # For horizontal bar plots, reverse so the largest appears at the top visually.
    plot_rows = list(reversed(selected))

    labels = []
    values = []

    for row in plot_rows:
        gate = row["gate"]
        pin = row["pin"]
        node = row["node"]
        apw = row["apw"]

        if gate and node:
            labels.append(f"{gate}/{pin} → {node}")
        elif node:
            labels.append(node)
        else:
            labels.append(row["original_name"])

        values.append(apw)

    height = max(4.0, 0.38 * len(plot_rows))
    plt.figure(figsize=(12, height))
    bars = plt.barh(labels, values)

    plt.xlabel("APW / Accumulated Pulse Width")
    plt.ylabel("Driver gate / node")
    plt.title(f"Top {len(plot_rows)} gatepins/nodes by APW")
    plt.tight_layout()

    for bar, value in zip(bars, values):
        plt.text(
            bar.get_width(),
            bar.get_y() + bar.get_height() / 2,
            f" {value:.6g}",
            va="center",
        )

    out_png.parent.mkdir(parents=True, exist_ok=True)
    plt.savefig(out_png, dpi=200, bbox_inches="tight")
    print(f"Wrote plot: {out_png}")


def main():
    args = parse_args()

    csv_path = Path(args.csv_file) if args.csv_file else prompt_for_csv(Path(args.reports_root))
    verilog_path = Path(args.verilog)
    out_png = Path(args.out_png) if args.out_png else csv_path.parent / "apw_gatepins.png"
    out_csv = Path(args.out_csv) if args.out_csv else csv_path.parent / "apw_gatepins_mapped.csv"

    if not csv_path.exists():
        raise FileNotFoundError(f"CSV file not found: {csv_path}")

    if not verilog_path.exists():
        raise FileNotFoundError(f"Verilog file not found: {verilog_path}")

    print(f"Input CSV: {csv_path}")
    print(f"Verilog:   {verilog_path}")

    driver_by_net, net_by_gatepin = parse_verilog_instances(verilog_path)
    rows = read_gatepin_csv(csv_path, driver_by_net, net_by_gatepin)

    rows = [row for row in rows if row["apw"] > args.min_apw]
    rows.sort(key=lambda row: row["apw"], reverse=not args.ascending)

    write_mapped_csv(rows, out_csv)
    print(f"Wrote mapped CSV: {out_csv}")

    plot_top_apw(rows, out_png, args.top, args.ascending)


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        sys.exit("Interrupted.")
