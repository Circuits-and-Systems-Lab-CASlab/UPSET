# This script performs a SET Analysis using the IHP SG13G2 OpenPDK standard cell library.
#
# Experiment workflow:
#   - Select an ECO experiment through ECO_SCRIPT.
#   - Use an empty/no-op ECO script for the baseline run.
#   - This script applies ECO_SCRIPT before STA/SET reporting, so every report
#     written under REPORT_PATH corresponds to the selected experiment.

# --------------------------------------------------------------------
# Helper procedures
# --------------------------------------------------------------------

proc require_env {var_name description} {
    if {![info exists ::env($var_name)] || $::env($var_name) eq ""} {
        puts "ERROR: $var_name environment variable is not set."
        puts "       Expected: $description"
        exit 1
    }
    return $::env($var_name)
}

proc optional_env {var_name default_value} {
    if {[info exists ::env($var_name)] && $::env($var_name) ne ""} {
        return $::env($var_name)
    }
    return $default_value
}

proc require_file {path description} {
    if {![file exists $path]} {
        puts "ERROR: $description does not exist:"
        puts "       $path"
        exit 1
    }
}

proc require_dir {path description} {
    if {![file isdirectory $path]} {
        puts "ERROR: $description does not exist or is not a directory:"
        puts "       $path"
        exit 1
    }
}

# --------------------------------------------------------------------
# Load configuration from environment
# --------------------------------------------------------------------

set BASE_DIR [require_env LIB "path to the IHP Open PDK SG13G2 directory"]
puts "Using library root: $BASE_DIR"

set DUT [require_env DESIGN "path to the Verilog netlist to analyze"]
puts "Using design Verilog: $DUT"

set DEF_FILE [require_env DESIGN_DEF "path to the DEF file of the design"]
puts "Using design DEF: $DEF_FILE"

set REPORT_DIR [optional_env REPORT_PATH "/workspace/reports/default"]
puts "Using report directory: $REPORT_DIR"

set CK [optional_env CLK "None"]
set PERIOD [optional_env CLK_PERIOD "None"]

if {$CK eq "None"} {
    puts "No clock specified."
} else {
    puts "Using clock signal: $CK"
    puts "Using clock period: $PERIOD"

    if {$PERIOD eq "None" || $PERIOD eq ""} {
        puts "ERROR: CLK is set, but CLK_PERIOD is not valid."
        exit 1
    }
}

set ECO_SCRIPT [optional_env ECO_SCRIPT "/workspace/experiments/000_baseline.tcl"]
puts "Using ECO experiment script: $ECO_SCRIPT"

# --------------------------------------------------------------------
# Library files
# --------------------------------------------------------------------

set LIB_FILE "$BASE_DIR/libs.ref/sg13g2_stdcell/lib/sg13g2_stdcell_typ_1p20V_25C.lib"

set LEF_FILES [list \
    "$BASE_DIR/libs.ref/sg13g2_stdcell/lef/sg13g2_tech.lef" \
    "$BASE_DIR/libs.ref/sg13g2_stdcell/lef/sg13g2_stdcell.lef" \
]

# --------------------------------------------------------------------
# Basic path checks
# --------------------------------------------------------------------

require_dir $BASE_DIR "IHP SG13G2 library root"
require_file $LIB_FILE "Liberty timing library"
require_file $DUT "Design Verilog file"
require_file $DEF_FILE "Design DEF file"
require_file $ECO_SCRIPT "ECO experiment script"

foreach lef_file $LEF_FILES {
    require_file $lef_file "LEF file"
}

file mkdir $REPORT_DIR

# Record reproducibility metadata for the run.
set metadata_file [open "$REPORT_DIR/experiment_metadata.txt" "w"]
puts $metadata_file "REPORT_PATH=$REPORT_DIR"
puts $metadata_file "ECO_SCRIPT=$ECO_SCRIPT"
puts $metadata_file "LIB=$BASE_DIR"
puts $metadata_file "DESIGN=$DUT"
puts $metadata_file "DESIGN_DEF=$DEF_FILE"
puts $metadata_file "CLK=$CK"
puts $metadata_file "CLK_PERIOD=$PERIOD"
close $metadata_file

# --------------------------------------------------------------------
# STEP 1: Load library files and design
# --------------------------------------------------------------------

puts "Loading LEF files..."
puts "  $LEF_FILES"

# Important:
# UPSET expects the LEF files to be loaded together.
# Do not call load_lef once per LEF file, otherwise UPSET may report:
# "LEF design data Exist in Memory!"
load_lef $LEF_FILES

puts "Loading Liberty file..."
load_lib $LIB_FILE

puts "Reading Verilog design..."
read_verilog $DUT

puts "Loading DEF file..."
load_def $DEF_FILE

# --------------------------------------------------------------------
# STEP 2: Set up the clock and timing constraints
# --------------------------------------------------------------------

if {$CK ne "None"} {
    puts "Creating clock: $CK with period: $PERIOD"

    create_clock -name $CK -period $PERIOD -waveform [list 0 [expr {$PERIOD / 2.0}]]

    set_input_delay 0 -clock $CK [all_inputs]
    set_output_delay $PERIOD -clock $CK [all_outputs]
} else {
    puts "No clock signal specified, skipping clock creation."
}

# --------------------------------------------------------------------
# STEP 3: Initial STA / graph levelisation
# --------------------------------------------------------------------

# UPSET ECO commands, especially eco_charge_sharing, expect timing/internal RAT
# queues to have been initialised.
puts "Performing initial Static Timing Analysis (STA) before ECO"
log_output_to_file "$REPORT_DIR/pre_eco_timing.log"
report_timing
close_log_output_file

# --------------------------------------------------------------------
# STEP 4: Optional ECO SET mitigation techniques
# --------------------------------------------------------------------

# ECOs are applied here, after the initial STA initialisation but before SET
# analysis and before this script writes the final compared SET reports. For the
# baseline, use the empty /workspace/experiments/000_baseline.tcl script.
puts "Applying ECO experiment after initial STA: $ECO_SCRIPT"
log_output_to_file "$REPORT_DIR/eco.log"
source $ECO_SCRIPT
close_log_output_file

# --------------------------------------------------------------------
# STEP 5: Post-ECO STA
# --------------------------------------------------------------------

# Re-run STA after ECO so timing.log reflects the design that will be analysed
# by the SET flow.
puts "Performing post-ECO Static Timing Analysis (STA)"
log_output_to_file "$REPORT_DIR/timing.log"
report_timing
close_log_output_file

# --------------------------------------------------------------------
# STEP 5: Post-ECO Area Report
# --------------------------------------------------------------------

# Capture area after ECO so each experiment directory contains timing, area,
# and SET metrics for the same mitigated design.
puts "Reporting post-ECO area"
log_output_to_file "$REPORT_DIR/area.log"
report_area
close_log_output_file

# --------------------------------------------------------------------
# STEP 6: Static Probability Annotation
# --------------------------------------------------------------------

# A default 50% probability is assigned to all circuit nodes.
puts "Performing Static Probability Annotation"
set_static_probability -value 0.5 -all

log_output_to_file "$REPORT_DIR/static_probabilities.log"
list_static_probabilities -significant_digits 4
close_log_output_file

# --------------------------------------------------------------------
# STEP 7: Create Particle Profiles
# --------------------------------------------------------------------

puts "Creating particle profiles"
create_particle_profile -name p1 -tdelay 0  -tau1 10p -tau2 100p -q 34f
create_particle_profile -name p2 -tdelay 1p -tau1 10p -tau2 100p -q 66f
create_particle_profile -name p3 -tdelay 1p -tau1 10p -tau2 100p -q 99f
create_particle_profile -name p4 -tdelay 1p -tau1 10p -tau2 100p -q 132f

# --------------------------------------------------------------------
# STEP 8: Single Event Transient Analysis
# --------------------------------------------------------------------

puts "Configuring SET Analysis"

# 0: Vanilla STA mode
# 1: Detailed TimeStamp-based STA mode
# 2: Bounded TimeStamp-based STA mode
set_SET_glitch_propagation_mode 1

# Use Double Exponential model for SET Generation.
set_SET_generation_parameters -model DEXP

puts "Performing Exhaustive SET Analysis"
log_output_to_file "$REPORT_DIR/set_analysis.log"
perform_exhaustive_SET_analysis -req 2
close_log_output_file

puts "Listing all gate pins SET analysis summary"
log_output_to_file "$REPORT_DIR/set_gatepins.log"
report_SET_analysis_sensitivity_measurements
close_log_output_file

puts "Dumping all gate pins SET analysis information to CSV"
dump_all_gatepins_SET_analysis_info_to_csv "$REPORT_DIR/set_gatepins.csv"

puts "SET analysis script completed."

# quit
