#!/usr/bin/env python3

import argparse
import csv
from pathlib import Path


def parse_args():
    parser = argparse.ArgumentParser(
        description="Sort UPSET set_gatepins.csv by ASET and print gatepin name + ASET."
    )
    parser.add_argument(
        "csv_file",
        help="Path to set_gatepins.csv",
    )
    parser.add_argument(
        "--descending",
        action="store_true",
        help="Sort by ASET descending instead of ascending.",
    )
    parser.add_argument(
        "--nonzero",
        action="store_true",
        help="Only show gatepins with ASET > 0.",
    )
    return parser.parse_args()


def to_float(value: str) -> float:
    value = value.strip()
    if value == "":
        return 0.0
    return float(value)


def main():
    args = parse_args()
    csv_path = Path(args.csv_file)

    if not csv_path.exists():
        raise FileNotFoundError(f"CSV file not found: {csv_path}")

    rows = []

    with csv_path.open("r", newline="") as f:
        reader = csv.DictReader(f)

        # Normalize header names because the CSV has spaces after commas.
        reader.fieldnames = [name.strip() for name in reader.fieldnames]

        for raw_row in reader:
            row = {key.strip(): value.strip() for key, value in raw_row.items()}

            gatepin = row["GATEPIN NAME"]
            aset = to_float(row["ASET"])

            if args.nonzero and aset <= 0:
                continue

            rows.append((gatepin, aset))

    rows.sort(key=lambda item: item[1], reverse=args.descending)

    print("GATEPIN NAME,ASET")
    for gatepin, aset in rows:
        print(f"{gatepin},{aset}")


if __name__ == "__main__":
    main()
