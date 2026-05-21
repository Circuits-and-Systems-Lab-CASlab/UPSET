# This script performs a SET Analysis using the IHP SG13G2 OpenPDK standard cell library

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

foreach lef_file $LEF_FILES {
    require_file $lef_file "LEF file"
}

file mkdir $REPORT_DIR

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
# STEP 2: Set up clock and timing constraints
# --------------------------------------------------------------------

if {$CK ne "None"} {
    puts "Creating clock: $CK with period: $PERIOD"

    create_clock -name $CK -period $PERIOD -waveform [list 0 [expr {$PERIOD / 2.0}]]

    # Simple default constraints.
    # If the design has a clock port in all_inputs, this may also apply input delay to it.
    # For more accurate timing, refine these constraints per design.
    set_input_delay 0 -clock $CK [all_inputs]
    set_output_delay $PERIOD -clock $CK [all_outputs]
} else {
    puts "Skipping clock creation."
}

# --------------------------------------------------------------------
# STEP 3: Perform STA
# --------------------------------------------------------------------

puts "Performing Static Timing Analysis (STA)"
log_output_to_file "$REPORT_DIR/timing.log"
report_timing
close_log_output_file

# --------------------------------------------------------------------
# STEP 4: Static Probability Annotation
# --------------------------------------------------------------------

puts "Performing Static Probability Annotation"
set_static_probability -value 0.5 -all

log_output_to_file "$REPORT_DIR/static_probabilities.log"
list_static_probabilities -significant_digits 4
close_log_output_file

# --------------------------------------------------------------------
# STEP 5: Create Particle Profiles
# --------------------------------------------------------------------

puts "Creating particle profiles"

create_particle_profile -name p1 -tdelay 0  -tau1 10p -tau2 100p -q 34f
create_particle_profile -name p2 -tdelay 1p -tau1 10p -tau2 100p -q 66f
create_particle_profile -name p3 -tdelay 1p -tau1 10p -tau2 100p -q 99f
create_particle_profile -name p4 -tdelay 1p -tau1 10p -tau2 100p -q 132f

# --------------------------------------------------------------------
# STEP 6: Single Event Transient Analysis
# --------------------------------------------------------------------

puts "Configuring SET Analysis"

# 0: Vanilla STA mode
# 1: Detailed TimeStamp-based STA mode
# 2: Bounded TimeStamp-based STA mode
set_SET_glitch_propagation_mode 1

# Use Double Exponential model for SET Generation
set_SET_generation_parameters -model DEXP

puts "Performing Exhaustive SET Analysis"
log_output_to_file "$REPORT_DIR/set_analysis.log"
perform_exhaustive_SET_analysis -req 2
close_log_output_file

puts "Listing all gate pins SET analysis information"
log_output_to_file "$REPORT_DIR/set_gatepins.log"
report_SET_analysis_sensitivity_measurements
close_log_output_file

# --------------------------------------------------------------------
# STEP 7: Optional ECO SET Mitigation Techniques
# --------------------------------------------------------------------

# ECO_SCRIPT can be overridden from the environment.
# Default path follows the current project layout:
# /workspace/scripts/eco_set_mitigations.tcl

set ECO_SCRIPT [optional_env ECO_SCRIPT "/workspace/scripts/eco_set_mitigations.tcl"]

if {[file exists $ECO_SCRIPT]} {
    puts "Sourcing ECO mitigation script: $ECO_SCRIPT"
    source $ECO_SCRIPT
} else {
    puts "WARNING: ECO mitigation script not found:"
    puts "         $ECO_SCRIPT"
    puts "Skipping ECO mitigation step."
}

puts "SET analysis script completed."

# quit