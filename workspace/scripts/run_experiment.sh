#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_DIR="$(cd -- "$SCRIPT_DIR/.." && pwd)"
EXPERIMENTS_DIR="${EXPERIMENTS_DIR:-$WORKSPACE_DIR/experiments}"
REPORTS_ROOT="${REPORTS_ROOT:-$WORKSPACE_DIR/reports/c1908}"
SET_ANALYSIS_SCRIPT="${SET_ANALYSIS_SCRIPT:-$SCRIPT_DIR/set_analysis.tcl}"
SUMMARY_SCRIPT="${SUMMARY_SCRIPT:-$SCRIPT_DIR/summarize_reports.py}"
PLOT_SUMMARY_SCRIPT="${PLOT_SUMMARY_SCRIPT:-$SCRIPT_DIR/plot_summary.py}"
PLOT_ASET_SCRIPT="${PLOT_ASET_SCRIPT:-$SCRIPT_DIR/plot_aset.py}"
PLOT_APW_SCRIPT="${PLOT_APW_SCRIPT:-$SCRIPT_DIR/plot_apw.py}"
SORT_ASET_SCRIPT="${SORT_ASET_SCRIPT:-$SCRIPT_DIR/sort_by_aset.py}"

usage() {
  cat <<USAGE
Usage:
  $SCRIPT_DIR/run_experiment.sh <experiment_name> <eco_script> [options]
  $SCRIPT_DIR/run_experiment.sh --all [options]
  $SCRIPT_DIR/run_experiment.sh [options]

If <experiment_name> and <eco_script> are omitted, the script prompts with
numbered options from:
  $EXPERIMENTS_DIR
The prompt also offers an "all" option to run every *.tcl experiment script,
or a numeric range such as "17-25" to run only that inclusive slice.

Experiment selection:
  --all
      Run all *.tcl scripts under EXPERIMENTS_DIR in sorted order. The experiment
      name is inferred from each script basename.

Post-processing options:
  --no-visualize, --no-plots
      Skip per-run ASET/APW mapping and PNG generation.
  --no-aset-plot
      Skip per-run ASET mapping/PNG generation with plot_aset.py.
  --no-apw-plot
      Skip per-run APW mapping/PNG generation with plot_apw.py.
  --no-sort-aset
      Skip per-run sorted ASET CSV generation with sort_by_aset.py.
  --no-summary
      Skip summary.csv refresh with summarize_reports.py.
  --no-summary-plots
      Skip summary metric PNG generation with plot_summary.py.
  --no-postprocess
      Skip all Python post-processing steps above.
  --summary-plots-dir <dir>
      Output directory for summary metric plots. Default: <REPORTS_ROOT>/plots.

Examples:
  $SCRIPT_DIR/run_experiment.sh 000_baseline $EXPERIMENTS_DIR/000_baseline.tcl
  $SCRIPT_DIR/run_experiment.sh 010_upsize_U222 $EXPERIMENTS_DIR/010_upsize_U222.tcl --no-summary-plots
  $SCRIPT_DIR/run_experiment.sh --all
  $SCRIPT_DIR/run_experiment.sh --no-postprocess

Environment overrides:
  LIB                  default: $WORKSPACE_DIR/pdks/IHP-Open-PDK/ihp-sg13g2
  DESIGN               default: $WORKSPACE_DIR/testcases/iscas85/c1908/c1908.v
  DESIGN_DEF           default: $WORKSPACE_DIR/testcases/iscas85/c1908/c1908.def
  CLK                  default: None
  CLK_PERIOD           default: None
  UPSET_BIN            default: UPSET
  EXPERIMENTS_DIR      default: $EXPERIMENTS_DIR
  REPORTS_ROOT         default: $REPORTS_ROOT
  SUMMARY_PLOTS_DIR    default: $REPORTS_ROOT/plots
  EXPERIMENT_REPORT_PATH optional explicit override for one single-experiment run's REPORT_PATH
USAGE
}

list_experiments() {
  if [[ ! -d "$EXPERIMENTS_DIR" ]]; then
    echo "ERROR: experiments directory not found: $EXPERIMENTS_DIR" >&2
    exit 1
  fi

  mapfile -t EXPERIMENT_FILES < <(find "$EXPERIMENTS_DIR" -maxdepth 1 -type f -name '*.tcl' | sort)

  if [[ ${#EXPERIMENT_FILES[@]} -eq 0 ]]; then
    echo "ERROR: no .tcl experiment files found under: $EXPERIMENTS_DIR" >&2
    exit 1
  fi
}

prompt_for_experiment() {
  list_experiments

  echo "Select an ECO experiment:"
  echo "   0) all experiments"
  local i
  for i in "${!EXPERIMENT_FILES[@]}"; do
    printf '  %2d) %s\n' "$((i + 1))" "$(basename "${EXPERIMENT_FILES[$i]}" .tcl)"
  done

  local choice start end i
  while true; do
    read -r -p "Choice [0-${#EXPERIMENT_FILES[@]}] or range (e.g. 17-25): " choice
    choice="${choice//[[:space:]]/}"
    if [[ "$choice" == "0" ]]; then
      RUN_ALL="1"
      break
    fi
    if [[ "$choice" =~ ^([0-9]+)-([0-9]+)$ ]]; then
      start="${BASH_REMATCH[1]}"
      end="${BASH_REMATCH[2]}"
      if (( start >= 1 && end >= start && end <= ${#EXPERIMENT_FILES[@]} )); then
        SELECTED_EXPERIMENT_FILES=()
        for ((i = start; i <= end; i++)); do
          SELECTED_EXPERIMENT_FILES+=("${EXPERIMENT_FILES[$((i - 1))]}")
        done
        break
      fi
    fi
    if [[ "$choice" =~ ^[0-9]+$ ]] && (( choice >= 1 && choice <= ${#EXPERIMENT_FILES[@]} )); then
      ECO_SCRIPT="${EXPERIMENT_FILES[$((choice - 1))]}"
      EXPERIMENT_NAME="$(basename "$ECO_SCRIPT" .tcl)"
      break
    fi
    echo "Invalid choice: $choice" >&2
  done
}

validate_experiment_name() {
  local experiment_name="$1"
  if [[ ! "$experiment_name" =~ ^[A-Za-z0-9._-]+$ ]]; then
    echo "ERROR: experiment_name must contain only letters, digits, dot, underscore, or dash: $experiment_name" >&2
    exit 2
  fi
}

absolute_path() {
  local path="$1"
  local dir
  dir="$(cd -- "$(dirname -- "$path")" && pwd)"
  printf '%s/%s\n' "$dir" "$(basename -- "$path")"
}

check_matplotlib() {
  python3 - <<'PY' >/dev/null 2>&1
import matplotlib  # noqa: F401
PY
}

check_pandas_matplotlib() {
  python3 - <<'PY' >/dev/null 2>&1
import matplotlib  # noqa: F401
import pandas  # noqa: F401
PY
}

run_python_with_matplotlib() {
  if check_matplotlib; then
    python3 "$@"
  else
    return 127
  fi
}

run_python_with_pandas_matplotlib() {
  if check_pandas_matplotlib; then
    python3 "$@"
  else
    return 127
  fi
}

RUN_ALL="0"
RUN_ASET_PLOT="1"
RUN_APW_PLOT="1"
RUN_SORT_ASET="1"
RUN_SUMMARY="1"
RUN_SUMMARY_PLOTS="1"
SUMMARY_PLOTS_DIR="${SUMMARY_PLOTS_DIR:-$REPORTS_ROOT/plots}"
SELECTED_EXPERIMENT_FILES=()
POSITIONAL=()

while [[ $# -gt 0 ]]; do
  case "$1" in
    --all)
      RUN_ALL="1"
      shift
      ;;
    --no-visualize|--no-plots)
      RUN_ASET_PLOT="0"
      RUN_APW_PLOT="0"
      shift
      ;;
    --no-aset-plot)
      RUN_ASET_PLOT="0"
      shift
      ;;
    --no-apw-plot)
      RUN_APW_PLOT="0"
      shift
      ;;
    --no-sort-aset)
      RUN_SORT_ASET="0"
      shift
      ;;
    --no-summary)
      RUN_SUMMARY="0"
      shift
      ;;
    --no-summary-plots)
      RUN_SUMMARY_PLOTS="0"
      shift
      ;;
    --no-postprocess)
      RUN_ASET_PLOT="0"
      RUN_APW_PLOT="0"
      RUN_SORT_ASET="0"
      RUN_SUMMARY="0"
      RUN_SUMMARY_PLOTS="0"
      shift
      ;;
    --summary-plots-dir)
      if [[ $# -lt 2 ]]; then
        echo "ERROR: --summary-plots-dir requires a directory argument" >&2
        usage >&2
        exit 2
      fi
      SUMMARY_PLOTS_DIR="$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    --)
      shift
      while [[ $# -gt 0 ]]; do
        POSITIONAL+=("$1")
        shift
      done
      ;;
    -*)
      echo "ERROR: unknown option: $1" >&2
      usage >&2
      exit 2
      ;;
    *)
      POSITIONAL+=("$1")
      shift
      ;;
  esac
done

case "${#POSITIONAL[@]}" in
  0)
    if [[ "$RUN_ALL" == "0" ]]; then
      prompt_for_experiment
    fi
    ;;
  1)
    if [[ "${POSITIONAL[0]}" == "all" ]]; then
      RUN_ALL="1"
    else
      echo "ERROR: single positional argument must be 'all', or provide both <experiment_name> and <eco_script>." >&2
      usage >&2
      exit 2
    fi
    ;;
  2)
    if [[ "$RUN_ALL" == "1" ]]; then
      echo "ERROR: --all cannot be combined with explicit <experiment_name> <eco_script>." >&2
      usage >&2
      exit 2
    fi
    EXPERIMENT_NAME="${POSITIONAL[0]}"
    ECO_SCRIPT="${POSITIONAL[1]}"
    ;;
  *)
    echo "ERROR: either provide both <experiment_name> and <eco_script>, provide 'all'/'--all', or provide neither to use the numbered prompt." >&2
    usage >&2
    exit 2
    ;;
esac

export LIB="${LIB:-$WORKSPACE_DIR/pdks/IHP-Open-PDK/ihp-sg13g2}"
export DESIGN="${DESIGN:-$WORKSPACE_DIR/testcases/iscas85/c1908/c1908.v}"
export DESIGN_DEF="${DESIGN_DEF:-$WORKSPACE_DIR/testcases/iscas85/c1908/c1908.def}"
export CLK="${CLK:-None}"
export CLK_PERIOD="${CLK_PERIOD:-None}"
export UPSET_BIN="${UPSET_BIN:-UPSET}"

run_one_experiment() {
  local experiment_name="$1"
  local eco_script="$2"
  local report_path

  validate_experiment_name "$experiment_name"

  if [[ ! -f "$eco_script" ]]; then
    echo "ERROR: ECO script not found: $eco_script" >&2
    exit 1
  fi

  # UPSET may execute the sourced TCL from a different working directory than this
  # shell, so pass an absolute ECO script path even if the user provided a relative
  # one such as experiments/000_baseline.tcl.
  eco_script="$(absolute_path "$eco_script")"

  if [[ "$RUN_ALL" == "1" ]]; then
    report_path="$REPORTS_ROOT/$experiment_name"
  else
    # Do not inherit REPORT_PATH from an interactive shell: a stale REPORT_PATH such as
    # /workspace/reports/c1908 makes runs write directly into the summary root, so the
    # summarizer sees zero experiment subdirectories. Use EXPERIMENT_REPORT_PATH only
    # when you intentionally want to override the per-experiment report directory.
    report_path="${EXPERIMENT_REPORT_PATH:-$REPORTS_ROOT/$experiment_name}"
  fi

  export ECO_SCRIPT="$eco_script"
  export REPORT_PATH="$report_path"

  mkdir -p "$REPORT_PATH"

  if [[ ! -w "$REPORT_PATH" ]]; then
    echo "ERROR: report directory is not writable by the current user: $REPORT_PATH" >&2
    echo "       This usually means a previous run created it as root." >&2
    echo "       Fix from the host/container with:" >&2
    echo "         sudo chown -R \"$(id -u):$(id -g)\" '$REPORT_PATH'" >&2
    echo "       or remove that experiment directory and rerun." >&2
    exit 1
  fi

  cat >"$REPORT_PATH/run_env.txt" <<EOF
EXPERIMENT_NAME=$experiment_name
REPORT_PATH=$REPORT_PATH
ECO_SCRIPT=$ECO_SCRIPT
LIB=$LIB
DESIGN=$DESIGN
DESIGN_DEF=$DESIGN_DEF
CLK=$CLK
CLK_PERIOD=$CLK_PERIOD
UPSET_BIN=$UPSET_BIN
EOF

  echo "==> Running UPSET experiment: $experiment_name"
  echo "    Reports: $REPORT_PATH"
  echo "    ECO:     $ECO_SCRIPT"

  set +e
  printf 'source %s\nexit\n' "$SET_ANALYSIS_SCRIPT" | "$UPSET_BIN" -no_gui | tee "$REPORT_PATH/upset_stdout.log"
  local pipeline_statuses=("${PIPESTATUS[@]}")

  local upset_status="${pipeline_statuses[1]}"
  if [[ "$upset_status" != "0" ]]; then
    echo "ERROR: UPSET exited abnormally for experiment $experiment_name (status=$upset_status)." >&2
    if [[ -f "$REPORT_PATH/eco.log" ]]; then
      echo "       ECO log tail:" >&2
      tail -n 20 "$REPORT_PATH/eco.log" >&2 || true
    fi
    echo "       See: $REPORT_PATH/upset_stdout.log" >&2
    return "$upset_status"
  fi
  set -e

  if [[ ! -f "$REPORT_PATH/set_gatepins.log" || ! "$REPORT_PATH/set_gatepins.log" -nt "$REPORT_PATH/run_env.txt" ]]; then
    echo "ERROR: SET analysis did not produce a fresh set_gatepins.log for this run." >&2
    echo "       See: $REPORT_PATH/upset_stdout.log" >&2
    set +e
    return 1
  fi

  if [[ ! -f "$REPORT_PATH/set_gatepins.csv" || ! "$REPORT_PATH/set_gatepins.csv" -nt "$REPORT_PATH/run_env.txt" ]]; then
    echo "ERROR: SET analysis did not produce a fresh set_gatepins.csv for this run." >&2
    echo "       See: $REPORT_PATH/upset_stdout.log" >&2
    set +e
    return 1
  fi

  if [[ -f "$REPORT_PATH/eco.log" ]] && grep -q '^ERROR:' "$REPORT_PATH/eco.log"; then
    echo "WARNING: ECO log contains errors; reports were still generated, but this mitigation may not have been applied." >&2
    echo "         See: $REPORT_PATH/eco.log" >&2
  fi

  if [[ "$RUN_SORT_ASET" == "1" ]]; then
    if [[ -f "$REPORT_PATH/set_gatepins.csv" && -f "$SORT_ASET_SCRIPT" ]]; then
      echo "==> Sorting ASET gatepins"
      python3 "$SORT_ASET_SCRIPT" "$REPORT_PATH/set_gatepins.csv" --descending --nonzero \
        >"$REPORT_PATH/aset_gatepins_sorted.csv"
    else
      echo "WARNING: missing set_gatepins.csv or sort_by_aset.py; skipping sorted ASET CSV." >&2
    fi
  fi

  if [[ "$RUN_ASET_PLOT" == "1" ]]; then
    if [[ -f "$REPORT_PATH/set_gatepins.csv" && -f "$DESIGN" && -f "$PLOT_ASET_SCRIPT" ]]; then
      echo "==> Generating per-run ASET plot"
      if ! run_python_with_matplotlib "$PLOT_ASET_SCRIPT" \
          "$REPORT_PATH/set_gatepins.csv" \
          --verilog "$DESIGN" \
          --top 25 \
          --out-png "$REPORT_PATH/aset_gatepins.png" \
          --out-csv "$REPORT_PATH/aset_gatepins_mapped.csv"; then
        echo "WARNING: matplotlib is not installed; skipping per-run ASET plot." >&2
        echo "         Rebuild/recreate the UPSET Docker image; for a one-off running-container fix, install python3-pip first as root, then: python3 -m pip install matplotlib" >&2
      fi
    else
      echo "WARNING: missing set_gatepins.csv, design file, or plot_aset.py; skipping per-run ASET plot." >&2
    fi
  fi

  if [[ "$RUN_APW_PLOT" == "1" ]]; then
    if [[ -f "$REPORT_PATH/set_gatepins.csv" && -f "$DESIGN" && -f "$PLOT_APW_SCRIPT" ]]; then
      echo "==> Generating per-run APW plot"
      if ! run_python_with_matplotlib "$PLOT_APW_SCRIPT" \
          "$REPORT_PATH/set_gatepins.csv" \
          --verilog "$DESIGN" \
          --top 25 \
          --out-png "$REPORT_PATH/apw_gatepins.png" \
          --out-csv "$REPORT_PATH/apw_gatepins_mapped.csv"; then
        echo "WARNING: matplotlib is not installed; skipping per-run APW plot." >&2
        echo "         Rebuild/recreate the UPSET Docker image; for a one-off running-container fix, install python3-pip first as root, then: python3 -m pip install matplotlib" >&2
      fi
    else
      echo "WARNING: missing set_gatepins.csv, design file, or plot_apw.py; skipping per-run APW plot." >&2
    fi
  fi

  echo "==> Done: $experiment_name"
}

if [[ "$RUN_ALL" == "1" || ${#SELECTED_EXPERIMENT_FILES[@]} -gt 0 ]]; then
  if [[ -n "${EXPERIMENT_REPORT_PATH:-}" ]]; then
    echo "ERROR: EXPERIMENT_REPORT_PATH cannot be used with multi-experiment runs because every experiment needs its own report directory." >&2
    exit 2
  fi

  if [[ "$RUN_ALL" == "1" ]]; then
    list_experiments
    SELECTED_EXPERIMENT_FILES=("${EXPERIMENT_FILES[@]}")
  fi

  FAILED_EXPERIMENTS=()
  if [[ "$RUN_ALL" == "1" ]]; then
    echo "==> Running all ${#SELECTED_EXPERIMENT_FILES[@]} experiment(s) from: $EXPERIMENTS_DIR"
  else
    echo "==> Running selected range of ${#SELECTED_EXPERIMENT_FILES[@]} experiment(s) from: $EXPERIMENTS_DIR"
  fi
  for eco_script in "${SELECTED_EXPERIMENT_FILES[@]}"; do
    experiment_name="$(basename "$eco_script" .tcl)"
    set +e
    run_one_experiment "$experiment_name" "$eco_script"
    experiment_status="$?"
    set -e

    if [[ "$experiment_status" != "0" ]]; then
      echo "WARNING: experiment failed and multi-experiment run will continue: $experiment_name (status=$experiment_status)" >&2
      FAILED_EXPERIMENTS+=("$experiment_name:$experiment_status")
    fi
  done
else
  set +e
  run_one_experiment "$EXPERIMENT_NAME" "$ECO_SCRIPT"
  experiment_status="$?"
  set -e
  if [[ "$experiment_status" != "0" ]]; then
    exit "$experiment_status"
  fi
fi

if [[ "$RUN_SUMMARY" == "1" ]]; then
  echo "==> Updating summary CSV"
  python3 "$SUMMARY_SCRIPT" "$REPORTS_ROOT" --out "$REPORTS_ROOT/summary.csv"
fi

if [[ "$RUN_SUMMARY_PLOTS" == "1" ]]; then
  if [[ -f "$REPORTS_ROOT/summary.csv" && -f "$PLOT_SUMMARY_SCRIPT" ]]; then
    echo "==> Generating summary metric plots"
    if ! run_python_with_pandas_matplotlib "$PLOT_SUMMARY_SCRIPT" "$REPORTS_ROOT/summary.csv" --out-dir "$SUMMARY_PLOTS_DIR"; then
      echo "WARNING: pandas/matplotlib are not installed; skipping summary metric plots." >&2
      echo "         Rebuild/recreate the UPSET Docker image; for a one-off running-container fix, install python3-pip first as root, then: python3 -m pip install pandas matplotlib" >&2
    fi
  else
    echo "WARNING: missing summary.csv or plot_summary.py; skipping summary metric plots." >&2
  fi
fi

if [[ "$RUN_ALL" == "1" || ${#SELECTED_EXPERIMENT_FILES[@]} -gt 0 ]]; then
  if [[ "$RUN_ALL" == "1" ]]; then
    echo "==> Done: all experiments"
  else
    echo "==> Done: selected range"
  fi
  if [[ ${#FAILED_EXPERIMENTS[@]} -gt 0 ]]; then
    echo "WARNING: ${#FAILED_EXPERIMENTS[@]} experiment(s) failed:" >&2
    printf '  %s\n' "${FAILED_EXPERIMENTS[@]}" >&2
    exit 1
  fi
fi
