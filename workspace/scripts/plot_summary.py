#!/usr/bin/env python3

from __future__ import annotations

import argparse
from pathlib import Path

import pandas as pd
import matplotlib.pyplot as plt


NON_METRIC_COLUMNS = {
    "run_name",
    "report_dir",
    "eco_script",
    "status",
}


def sanitize_filename(name: str) -> str:
    return (
        name.strip()
        .replace(" ", "_")
        .replace("/", "_")
        .replace("\\", "_")
        .replace("%", "pct")
    )


def plot_metric(
    df: pd.DataFrame,
    metric: str,
    out_dir: Path,
    baseline_name: str = "000_baseline",
) -> None:
    plot_df = df[["run_name", "status", metric]].copy()

    # Keep input order from summary.csv.
    plot_df["run_name"] = plot_df["run_name"].astype(str)
    plot_df["status"] = plot_df["status"].astype(str)

    fig_width = max(10, 0.55 * len(plot_df))
    fig, ax = plt.subplots(figsize=(fig_width, 5))

    x = range(len(plot_df))
    values = plot_df[metric]

    bars = ax.bar(x, values)

    # Mark failed / non-ok runs visually.
    for bar, status in zip(bars, plot_df["status"]):
        if status != "ok":
            bar.set_alpha(0.45)
            bar.set_hatch("//")

    # Baseline horizontal line if available.
    baseline_rows = plot_df[plot_df["run_name"] == baseline_name]
    if not baseline_rows.empty:
        baseline_value = baseline_rows.iloc[0][metric]
        ax.axhline(
            baseline_value,
            linestyle="--",
            linewidth=1,
            label=f"{baseline_name}: {baseline_value:.4g}",
        )
        ax.legend()

    ax.set_title(metric)
    ax.set_xlabel("Run")
    ax.set_ylabel(metric)
    ax.set_xticks(list(x))
    ax.set_xticklabels(plot_df["run_name"], rotation=45, ha="right")

    ax.grid(axis="y", linestyle="--", alpha=0.35)

    fig.tight_layout()

    out_path = out_dir / f"{sanitize_filename(metric)}.png"
    fig.savefig(out_path, dpi=200)
    plt.close(fig)

    print(f"[OK] wrote {out_path}")


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Plot every numeric metric from a Hermes/UPSET summary.csv file."
    )
    parser.add_argument(
        "summary_csv",
        nargs="?",
        default="reports/c1908/summary.csv",
        help="Path to summary.csv. Default: reports/c1908/summary.csv",
    )
    parser.add_argument(
        "--out-dir",
        default="plots",
        help="Output directory for plots. Default: plots",
    )
    parser.add_argument(
        "--baseline",
        default="000_baseline",
        help="Baseline run name used for horizontal reference line.",
    )
    parser.add_argument(
        "--include",
        nargs="*",
        default=None,
        help="Optional explicit list of metric columns to plot.",
    )
    parser.add_argument(
        "--exclude",
        nargs="*",
        default=[],
        help="Optional metric columns to skip.",
    )

    args = parser.parse_args()

    summary_path = Path(args.summary_csv)
    out_dir = Path(args.out_dir)

    if not summary_path.exists():
        raise FileNotFoundError(f"summary.csv not found: {summary_path}")

    out_dir.mkdir(parents=True, exist_ok=True)

    df = pd.read_csv(summary_path)

    if "run_name" not in df.columns:
        raise ValueError("summary.csv must contain a 'run_name' column")

    if "status" not in df.columns:
        df["status"] = "unknown"

    if args.include:
        metrics = args.include
    else:
        metrics = []
        for col in df.columns:
            if col in NON_METRIC_COLUMNS:
                continue

            numeric = pd.to_numeric(df[col], errors="coerce")
            if numeric.notna().any():
                df[col] = numeric
                metrics.append(col)

    metrics = [m for m in metrics if m not in set(args.exclude)]

    if not metrics:
        raise ValueError("No numeric metric columns found to plot")

    print(f"Input:  {summary_path}")
    print(f"Output: {out_dir}")
    print(f"Metrics: {', '.join(metrics)}")

    for metric in metrics:
        if metric not in df.columns:
            print(f"[WARN] skipping missing metric: {metric}")
            continue

        df[metric] = pd.to_numeric(df[metric], errors="coerce")
        plot_metric(df, metric, out_dir, baseline_name=args.baseline)


if __name__ == "__main__":
    main()
