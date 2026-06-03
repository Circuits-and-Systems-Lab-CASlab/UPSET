#!/usr/bin/env python3
"""Summarize UPSET SET-analysis reports across experiment directories."""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path
from typing import Dict, Iterable, Optional

METRIC_PATTERNS = {
    "total_aset": re.compile(r"Total ASET:\s*([-+0-9.eE]+)"),
    "total_latched_aset": re.compile(r"Total Latched ASET:\s*([-+0-9.eE]+)"),
    "total_apw": re.compile(r"Total Accumulated Pulse Widths \(ΣPW\):\s*([-+0-9.eE]+)"),
    "avg_apw_per_terminal_node": re.compile(r"Avg ΣPW per Terminal Node:\s*([-+0-9.eE]+)"),
    "endpoints": re.compile(r"Endpoints:\s*([0-9]+)"),
    "affected_endpoints": re.compile(r"Affected Endpoints:\s*([0-9]+)"),
    "avg_aset_per_terminal_node": re.compile(r"Avg ASET per Terminal Node:\s*([-+0-9.eE]+)"),
    "avg_latched_aset_per_terminal_node": re.compile(r"Avg Latched ASET per Terminal Node:\s*([-+0-9.eE]+)"),
}

FLOAT_FIELDS = [
    "total_aset",
    "total_latched_aset",
    "total_apw",
    "avg_apw_per_terminal_node",
    "avg_aset_per_terminal_node",
    "avg_latched_aset_per_terminal_node",
]

INT_FIELDS = ["endpoints", "affected_endpoints"]

FIELDNAMES = [
    "run_name",
    "report_dir",
    "eco_script",
    "status",
    *FLOAT_FIELDS,
    *INT_FIELDS,
    "delta_aset_pct",
    "delta_latched_aset_pct",
    "delta_apw_pct",
]


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "reports_root",
        nargs="?",
        default="/workspace/reports/c1908",
        help="Directory containing one subdirectory per experiment.",
    )
    parser.add_argument(
        "--out",
        default=None,
        help="Output summary CSV path. Default: <reports_root>/summary.csv",
    )
    parser.add_argument(
        "--baseline",
        default="000_baseline",
        help="Baseline run name used for percentage deltas.",
    )
    return parser.parse_args()


def to_float(value: str) -> float:
    return float(value.strip())


def parse_metadata(report_dir: Path) -> Dict[str, str]:
    metadata: Dict[str, str] = {}
    for filename in ("experiment_metadata.txt", "run_env.txt"):
        path = report_dir / filename
        if not path.exists():
            continue
        for line in path.read_text(errors="replace").splitlines():
            if "=" in line:
                key, value = line.split("=", 1)
                metadata[key.strip()] = value.strip()
    return metadata


def parse_log(report_dir: Path) -> Dict[str, str]:
    log_path = report_dir / "set_gatepins.log"
    row: Dict[str, str] = {
        "run_name": report_dir.name,
        "report_dir": str(report_dir),
        "eco_script": parse_metadata(report_dir).get("ECO_SCRIPT", ""),
        "status": "missing_set_gatepins_log",
    }

    if not log_path.exists():
        return row

    text = log_path.read_text(errors="replace")
    row["status"] = "ok"

    eco_log_path = report_dir / "eco.log"
    if eco_log_path.exists():
        eco_text = eco_log_path.read_text(errors="replace")
        if re.search(r"(^|\n)\s*ERROR:", eco_text):
            row["status"] = "eco_error"

    for field, pattern in METRIC_PATTERNS.items():
        match = pattern.search(text)
        if match:
            row[field] = match.group(1)
        else:
            row[field] = ""
            row["status"] = "missing_metrics"

    return row


def iter_report_dirs(reports_root: Path) -> Iterable[Path]:
    for path in sorted(reports_root.iterdir()):
        if not path.is_dir():
            continue
        # Post-processing outputs such as <reports_root>/plots are not
        # experiment runs and should not become summary rows.
        if path.name in {"plots", "__pycache__"} or path.name.startswith("."):
            continue
        yield path


def row_float(row: Dict[str, str], field: str) -> Optional[float]:
    try:
        value = row.get(field, "")
        if value == "":
            return None
        return float(value)
    except ValueError:
        return None


def pct_delta(value: Optional[float], baseline: Optional[float]) -> str:
    if value is None or baseline is None or baseline == 0:
        return ""
    return f"{((value - baseline) / baseline) * 100.0:.6f}"


def add_deltas(rows: list[Dict[str, str]], baseline_name: str) -> None:
    baseline = next((row for row in rows if row["run_name"] == baseline_name), None)
    if baseline is None and rows:
        # Prefer a usable summary over failing when the user has not run baseline yet.
        baseline = rows[0]

    base_aset = row_float(baseline, "total_aset") if baseline else None
    base_laset = row_float(baseline, "total_latched_aset") if baseline else None
    base_apw = row_float(baseline, "total_apw") if baseline else None

    for row in rows:
        row["delta_aset_pct"] = pct_delta(row_float(row, "total_aset"), base_aset)
        row["delta_latched_aset_pct"] = pct_delta(row_float(row, "total_latched_aset"), base_laset)
        row["delta_apw_pct"] = pct_delta(row_float(row, "total_apw"), base_apw)


def write_summary(rows: list[Dict[str, str]], out_path: Path) -> None:
    out_path.parent.mkdir(parents=True, exist_ok=True)
    with out_path.open("w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=FIELDNAMES)
        writer.writeheader()
        for row in rows:
            writer.writerow({field: row.get(field, "") for field in FIELDNAMES})


def main() -> None:
    args = parse_args()
    reports_root = Path(args.reports_root)
    if not reports_root.exists():
        raise FileNotFoundError(f"Reports root not found: {reports_root}")

    out_path = Path(args.out) if args.out else reports_root / "summary.csv"
    rows = [parse_log(path) for path in iter_report_dirs(reports_root)]
    add_deltas(rows, args.baseline)
    write_summary(rows, out_path)

    print(f"Wrote {out_path} with {len(rows)} run(s).")
    for row in rows:
        print(
            f"{row['run_name']}: status={row.get('status', '')} "
            f"ASET={row.get('total_aset', '')} "
            f"LASET={row.get('total_latched_aset', '')} "
            f"APW={row.get('total_apw', '')} "
            f"ΔASET%={row.get('delta_aset_pct', '')} "
            f"ΔAPW%={row.get('delta_apw_pct', '')}"
        )


if __name__ == "__main__":
    main()
