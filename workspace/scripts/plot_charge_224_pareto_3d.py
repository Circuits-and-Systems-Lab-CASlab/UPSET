#!/usr/bin/env python3
"""Plot the U224/X charge-sharing sweep in 3D: ASET, APW, and area.

The script reads reports/c1908/summary.csv after the sweep experiments have been
run, extracts runs named like 060_5_charge_224, 061_5_charge_224, ... and reads
`-num` directly from each experiment TCL file so the plotted labels match the ECO
commands rather than the numeric run prefix.
"""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path
from typing import Any, Iterable


def resolve_existing_path(path: Path, fallback_base: Path) -> Path:
    """Resolve relative defaults from either cwd or the workspace root."""
    if path.exists():
        return path
    if not path.is_absolute():
        fallback = fallback_base / path
        if fallback.exists():
            return fallback
    return path


def read_summary(summary_csv: Path) -> list[dict[str, str]]:
    if not summary_csv.exists():
        raise FileNotFoundError(f"summary.csv not found: {summary_csv}")
    with summary_csv.open(newline="") as f:
        return list(csv.DictReader(f))


def read_charge_num(eco_script: str | None, experiments_dir: Path, run_name: str) -> int | None:
    candidates: list[Path] = []
    if eco_script:
        p = Path(eco_script)
        candidates.append(p)
        if not p.is_absolute():
            candidates.append(experiments_dir.parent / p)
            candidates.append(experiments_dir / p.name)
    candidates.append(experiments_dir / f"{run_name}.tcl")

    for path in candidates:
        if not path.exists():
            continue
        text = path.read_text(errors="replace")
        match = re.search(
            r"eco_charge_sharing\s+c1908/U224/X\s+"
            r"-cell\s+sg13g2_inv_1\s+-num\s+(\d+)\s+-placementmethod\s+1",
            text,
        )
        if match:
            return int(match.group(1))
    return None


def to_float(row: dict[str, str], key: str) -> float:
    try:
        return float(row[key])
    except KeyError as exc:
        raise KeyError(f"summary.csv is missing required column: {key}") from exc
    except ValueError as exc:
        raise ValueError(f"non-numeric {key} for {row.get('run_name', '<unknown>')}: {row.get(key)!r}") from exc


def is_pareto_efficient(points: list[dict[str, Any]]) -> list[bool]:
    """Return True for non-dominated points, minimizing ASET, APW, and area."""
    flags: list[bool] = []
    for i, p in enumerate(points):
        dominated = False
        pvals = (float(p["total_aset"]), float(p["total_apw"]), float(p["area"]))
        for j, q in enumerate(points):
            if i == j:
                continue
            qvals = (float(q["total_aset"]), float(q["total_apw"]), float(q["area"]))
            if all(qv <= pv for qv, pv in zip(qvals, pvals)) and any(qv < pv for qv, pv in zip(qvals, pvals)):
                dominated = True
                break
        flags.append(not dominated)
    return flags


def collect_points(
    rows: Iterable[dict[str, str]],
    experiments_dir: Path,
    run_regex: re.Pattern[str],
    ok_only: bool,
) -> list[dict[str, Any]]:
    points: list[dict[str, Any]] = []
    for row in rows:
        run_name = row.get("run_name", "")
        if not run_regex.fullmatch(run_name):
            continue
        status = row.get("status", "")
        if ok_only and status != "ok":
            continue
        num = read_charge_num(row.get("eco_script"), experiments_dir, run_name)
        if num is None:
            print(f"[WARN] skipping {run_name}: could not find U224/X -num in TCL")
            continue
        points.append(
            {
                "run_name": run_name,
                "num": num,
                "status": status,
                "total_aset": to_float(row, "total_aset"),
                "total_apw": to_float(row, "total_apw"),
                "area": to_float(row, "area"),
                "delta_aset_pct": to_float(row, "delta_aset_pct") if row.get("delta_aset_pct") else float("nan"),
                "delta_apw_pct": to_float(row, "delta_apw_pct") if row.get("delta_apw_pct") else float("nan"),
                "delta_area_pct": to_float(row, "delta_area_pct") if row.get("delta_area_pct") else float("nan"),
            }
        )
    points.sort(key=lambda p: int(p["num"]))
    return points


def write_points_csv(points: list[dict[str, Any]], out_csv: Path) -> None:
    out_csv.parent.mkdir(parents=True, exist_ok=True)
    fieldnames = [
        "num",
        "run_name",
        "status",
        "pareto_efficient",
        "total_aset",
        "total_apw",
        "area",
        "delta_aset_pct",
        "delta_apw_pct",
        "delta_area_pct",
    ]
    with out_csv.open("w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        for p in points:
            writer.writerow({k: p.get(k, "") for k in fieldnames})
    print(f"[OK] wrote {out_csv}")


def plot_3d(points: list[dict[str, Any]], out_png: Path, title: str, elev: float, azim: float) -> None:
    try:
        import matplotlib.pyplot as plt  # type: ignore[import-not-found]
    except ImportError as exc:
        raise SystemExit(
            "matplotlib is required for plotting. Rebuild/recreate the UPSET Docker image "
            "or install python plotting dependencies, then rerun this script."
        ) from exc

    fig = plt.figure(figsize=(12, 9))
    ax = fig.add_subplot(111, projection="3d")

    pareto = [bool(p["pareto_efficient"]) for p in points]
    xs = [float(p["total_aset"]) for p in points]
    ys = [float(p["total_apw"]) for p in points]
    zs = [float(p["area"]) for p in points]
    nums = [int(p["num"]) for p in points]

    xmin, xmax = min(xs), max(xs)
    ymin, ymax = min(ys), max(ys)
    zmin, zmax = min(zs), max(zs)
    xpad = max((xmax - xmin) * 0.08, 0.15)
    ypad = max((ymax - ymin) * 0.08, 0.25)
    zpad = max((zmax - zmin) * 0.08, 15.0)
    floor_z = zmin - zpad
    wall_x = xmin - xpad
    wall_y = ymin - ypad

    # Plot all points, then overplot Pareto-efficient points with a stronger marker.
    scatter = ax.scatter(xs, ys, zs, c=nums, cmap="viridis", s=70, depthshade=True, label="sweep point")
    px = [x for x, keep in zip(xs, pareto) if keep]
    py = [y for y, keep in zip(ys, pareto) if keep]
    pz = [z for z, keep in zip(zs, pareto) if keep]
    if px:
        ax.scatter(px, py, pz, s=135, marker="*", color="crimson", label="Pareto-efficient")

    # Connect points in increasing -num order to show the sweep trajectory.
    ax.plot(xs, ys, zs, linestyle="--", linewidth=1.2, alpha=0.65, color="gray")

    # Helper/projection lines: vertical to the area floor plus projections to the
    # ASET/APW side walls. These make it easier to read each point's coordinates.
    for x, y, z in zip(xs, ys, zs):
        ax.plot([x, x], [y, y], [floor_z, z], linestyle=":", linewidth=0.9, color="0.45", alpha=0.6)
        ax.plot([wall_x, x], [y, y], [z, z], linestyle=":", linewidth=0.8, color="0.55", alpha=0.45)
        ax.plot([x, x], [wall_y, y], [z, z], linestyle=":", linewidth=0.8, color="0.55", alpha=0.45)

    for x, y, z, num, keep in zip(xs, ys, zs, nums, pareto):
        label = (
            f"n={num}" + (" *" if keep else "") + "\n"
            f"x={x:.3f}\n"
            f"y={y:.3f}\n"
            f"z={z:.2f}"
        )
        ax.text(x + xpad * 0.15, y + ypad * 0.15, z + zpad * 0.15, label, fontsize=7)

    ax.set_xlim(wall_x, xmax + xpad)
    ax.set_ylim(wall_y, ymax + ypad)
    ax.set_zlim(floor_z, zmax + zpad)
    ax.view_init(elev=elev, azim=azim)
    ax.grid(True)

    ax.set_xlabel("Total ASET, x (lower is better)")
    ax.set_ylabel("Total APW, y (lower is better)")
    ax.set_zlabel("Area [μm²], z (lower is better)")
    ax.set_title(title)
    fig.colorbar(scatter, ax=ax, shrink=0.65, pad=0.1, label="eco_charge_sharing -num")
    ax.legend(loc="best")
    fig.tight_layout()

    out_png.parent.mkdir(parents=True, exist_ok=True)
    fig.savefig(out_png, dpi=220)
    plt.close(fig)
    print(f"[OK] wrote {out_png}")


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Create a 3D Pareto plot for the c1908 U224/X charge-sharing -num sweep."
    )
    parser.add_argument(
        "summary_csv",
        nargs="?",
        default="reports/c1908/summary.csv",
        help="Path to summary.csv. Default: reports/c1908/summary.csv",
    )
    parser.add_argument(
        "--experiments-dir",
        default="experiments",
        help="Directory containing 060_5_charge_224.tcl etc. Default: experiments",
    )
    parser.add_argument(
        "--run-regex",
        default=r"06[0-9]_5_charge_224",
        help="Regex for sweep run names. Default: 06[0-9]_5_charge_224",
    )
    parser.add_argument(
        "--out-dir",
        default="reports/c1908/plots",
        help="Output directory. Default: reports/c1908/plots",
    )
    parser.add_argument(
        "--include-non-ok",
        action="store_true",
        help="Include runs whose status is not 'ok'. By default they are skipped.",
    )
    parser.add_argument(
        "--view-elev",
        type=float,
        default=24.0,
        help="3D view elevation angle. Default: 24",
    )
    parser.add_argument(
        "--view-azim",
        type=float,
        default=-58.0,
        help="3D view azimuth angle. Default: -58",
    )
    args = parser.parse_args()

    workspace_root = Path(__file__).resolve().parents[1]
    summary_csv = resolve_existing_path(Path(args.summary_csv), workspace_root)
    experiments_dir = resolve_existing_path(Path(args.experiments_dir), workspace_root)
    out_dir = Path(args.out_dir)
    if not out_dir.is_absolute() and not out_dir.exists() and not Path(args.out_dir).parent.exists():
        out_dir = workspace_root / out_dir
    run_regex = re.compile(args.run_regex)

    rows = read_summary(summary_csv)
    points = collect_points(rows, experiments_dir, run_regex, ok_only=not args.include_non_ok)
    if not points:
        raise SystemExit(
            "No completed U224/X sweep runs found in summary.csv. "
            "Run the experiments first and refresh summary.csv."
        )

    pareto_flags = is_pareto_efficient(points)
    for p, keep in zip(points, pareto_flags):
        p["pareto_efficient"] = keep

    print("U224/X charge-sharing sweep points:")
    for p in points:
        star = " *pareto" if p["pareto_efficient"] else ""
        print(
            f"  -num {p['num']:>3}: ASET={float(p['total_aset']):.6g}, "
            f"APW={float(p['total_apw']):.6g}, area={float(p['area']):.6g}{star} "
            f"({p['run_name']})"
        )

    write_points_csv(points, out_dir / "charge_224_pareto_points.csv")
    plot_3d(
        points,
        out_dir / "charge_224_pareto_3d.png",
        "U224/X charge-sharing Pareto sweep",
        elev=args.view_elev,
        azim=args.view_azim,
    )


if __name__ == "__main__":
    main()
