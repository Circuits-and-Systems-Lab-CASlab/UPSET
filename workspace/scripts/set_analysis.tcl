# This script performs a SET Analysis using the IHP SG13G2 OpenPDK standard cell library

# ------------------------------------------------------------
# Helper procedures
# ------------------------------------------------------------

proc require_env {name} {
    if {![info exists ::env($name)] || $::env($name) eq ""} {
        puts "ERROR: $name environment variable is not set."
        exit 1
    }
    return $::env($name)
}

proc env_or_default {name default} {
    if {[info exists ::env($name)] && $::env($name) ne ""} {
        return $::env($name)
    }
    return $default
}

proc require_file {path description} {
    if {![file exists $path]} {
        puts "ERROR: $description not found:"
        puts "  $path"
        exit 1
    }
}

# ------------------------------------------------------------
# Configuration from environment
# ------------------------------------------------------------

set BASE_DIR    [require_env LIB]
set DUT         [require_env DESIGN]
set DEF_FILE    [require_env DESIGN_DEF]

set REPORT_DIR  [env_or_default REPORT_PATH "/workspace/reports"]
set CK          [env_or_default CLK "None"]
set PERIOD      [env_or_default CLK_PERIOD "None"]

puts "Using library root: $BASE_DIR"
puts "Using design Verilog: $DUT"
puts "Using design DEF: $DEF_FILE"
puts "Using report directory: $REPORT_DIR"

if {$CK ne "None"} {
    puts "Using clock: $CK"
    puts "Using clock period: $PERIOD"

    if {$PERIOD eq "None" || $PERIOD eq ""} {
        puts "ERROR: CLK is set, but CLK_PERIOD is missing."
        exit 1
    }
} else {
    puts "No clock specified."
}

file mkdir $REPORT_DIR

# ------------------------------------------------------------
# Library and design files
# ------------------------------------------------------------

set LIB_FILE "$BASE_DIR/libs.ref/sg13g2_stdcell/lib/sg13g2_stdcell_typ_1p20V_25C.lib"

set LEF_FILES [list \
    "$BASE_DIR/libs.ref/sg13g2_stdcell/lef/sg13g2_tech.lef" \
    "$BASE_DIR/libs.ref/sg13g2_stdcell/lef/sg13g2_stdcell.lef" \
]

require_file $LIB_FILE "Liberty file"
require_file $DUT "Design Verilog file"
require_file $DEF_FILE "Design DEF file"

foreach lef $LEF_FILES {
    require_file $lef "LEF file"
}

# ------------------------------------------------------------
# STEP 1: Load library files and design
# ------------------------------------------------------------

puts "Loading LEF files..."
foreach lef $LEF_FILES {
    puts "  $lef"
    load_lef $lef
}

puts "Loading Liberty file..."
load_lib $LIB_FILE

puts "Reading Verilog design..."
read_verilog $DUT

puts "Loading DEF..."
load_def $DEF_FILE

# ------------------------------------------------------------
# STEP 2: Clock and timing constraints
# ------------------------------------------------------------

if {$CK ne "None"} {
    puts "Creating clock: $CK with period: $PERIOD"

    create_clock -name $CK -period $PERIOD -waveform [list 0 [expr {$PERIOD / 2.0}]]

    # Simple/default constraints.
    # If your UPSET/OpenSTA command set supports excluding the clock from all_inputs,
    # it is better to avoid setting input delay on the clock port itself.
    set_input_delay 0 -clock $CK [all_inputs]
    set_output_delay $PERIOD -clock $CK [all_outputs]
} else {
    puts "Skipping clock creation."
}

# ------------------------------------------------------------
# STEP 3: Static Timing Analysis
# ------------------------------------------------------------

puts "Performing Static Timing Analysis..."
log_output_to_file "$REPORT_DIR/timing.log"
report_timing
close_log_output_file

# ------------------------------------------------------------
# STEP 4: Static Probability Annotation
# ------------------------------------------------------------

puts "Performing Static Probability Annotation..."
set_static_probability -value 0.5 -all

log_output_to_file "$REPORT_DIR/static_probabilities.log"
list_static_probabilities -significant_digits 4
close_log_output_file

# ------------------------------------------------------------
# STEP 5: Particle Profiles
# ------------------------------------------------------------

puts "Creating particle profiles..."

create_particle_profile -name p1 -tdelay 0  -tau1 10p -tau2 100p -q 34f
create_particle_profile -name p2 -tdelay 1p -tau1 10p -tau2 100p -q 66f
create_particle_profile -name p3 -tdelay 1p -tau1 10p -tau2 100p -q 99f
create_particle_profile -name p4 -tdelay 1p -tau1 10p -tau2 100p -q 132f

# ------------------------------------------------------------
# STEP 6: SET Analysis
# ------------------------------------------------------------

puts "Configuring SET analysis..."

# 0: Vanilla STA mode
# 1: Detailed TimeStamp-based STA mode
# 2: Bounded TimeStamp-based STA mode
set_SET_glitch_propagation_mode 1

# Double Exponential model for SET generation
set_SET_generation_parameters -model DEXP

puts "Performing Exhaustive SET Analysis..."
log_output_to_file "$REPORT_DIR/set_analysis.log"
perform_exhaustive_SET_analysis -req 2
close_log_output_file

puts "Reporting SET sensitivity measurements..."
log_output_to_file "$REPORT_DIR/set_gatepins.log"
report_SET_analysis_sensitivity_measurements
close_log_output_file

# ------------------------------------------------------------
# STEP 7: Optional ECO SET mitigation script
# ------------------------------------------------------------

set ECO_SCRIPT [env_or_default ECO_SCRIPT ""]

if {$ECO_SCRIPT eq ""} {
    if {[file exists "/workspace/eco_set_mitigations.tcl"]} {
        set ECO_SCRIPT "/workspace/eco_set_mitigations.tcl"
    } elseif {[file exists "/workspace/scripts/eco_set_mitigations.tcl"]} {
        set ECO_SCRIPT "/workspace/scripts/eco_set_mitigations.tcl"
    }
}

if {$ECO_SCRIPT ne "" && [file exists $ECO_SCRIPT]} {
    puts "Sourcing ECO mitigation script: $ECO_SCRIPT"
    source $ECO_SCRIPT
} else {
    puts "No ECO mitigation script found. Skipping ECO step."
}

puts "SET analysis flow completed."
