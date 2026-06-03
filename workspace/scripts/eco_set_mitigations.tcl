# Legacy default ECO hook.
#
# The organized experiment workflow now uses ECO_SCRIPT to point at one file under:
#   /workspace/experiments/*.tcl
#
# Use /workspace/experiments/000_baseline.tcl for the no-op baseline run.
# This file remains as a safe no-op fallback for manual runs that still source
# /workspace/scripts/eco_set_mitigations.tcl.
puts "Legacy eco_set_mitigations.tcl: no ECO mitigation commands applied."
