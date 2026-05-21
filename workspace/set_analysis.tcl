# This script performs a SET Analysis using the IHP SG13G2 (OpenPDK) standard cell library

# --- Load the IHP Open PDK library files and the design to be analyzed ---

# WARNING: Set the global variable LIB to specify the path where the library files are located
if {![info exists ::env(LIB)]} {
    puts "ERROR: LIB environment variable is not set. Please set it to the path of the IHP Open PDK library files."
    exit 1
} else {
    puts "Using library files from: $env(LIB)"
}

# NOTE: This script is configured to load the SG13G2 standard cell library from IHP and the designs that are synthesized with this libraries
set BASE_DIR $env(LIB)

# NOTE: In this script the typical corner is loaded. In case another corner is needed for your analysis, please load the corresponding library file
# NOTE: Currently, UPSET does not support multi corner analysis, so only one library file can be loaded at a time
set LIB_FILE "$BASE_DIR/libs.ref/sg13g2_stdcell/lib/sg13g2_stdcell_typ_1p20V_25C.lib"
set LEF_FILES [list $BASE_DIR/libs.ref/sg13g2_stdcell/lef/sg13g2_tech.lef $BASE_DIR/libs.ref/sg13g2_stdcell/lef/sg13g2_stdcell.lef]

# NOTE: The REPORT_PATH environment variable is used to specify the path where the reports will be saved
if {![info exists ::env(REPORT_PATH)]} {
    puts "WARNING: REPORT_PATH environment variable is not set. Defaulting to 'Reports'."
    set REPORT_PATH "Reports"
} else {
    puts "Using report path from: $env(REPORT_PATH)"
}

set REPORT_DIR $REPORT_PATH
file mkdir $REPORT_DIR

if {![info exists ::env(DESIGN)]} {
    puts "ERROR: DESIGN environment variable is not set. Please set it to the path of the design you want to analyze."
    exit 1
} else {
    puts "Using design from: $env(DESIGN)"
}

# WARNING: Set the global variable DESIGN to specify the path of the design you want to analyse
set DUT $env(DESIGN)

if {![info exists ::env(DESIGN_DEF)]} {
    puts "ERROR: DESIGN_DEF environment variable is not set. Please set it to the path of the DEF file of the design you want to analyze."
    exit 1
} else {
    puts "Using DEF file from: $env(DESIGN_DEF)"
}

# WARNING: Set the global variable DESIGN_DEF to specify the path of the DEF file of the design, containing the placement information, you want to analyze
set DEF_FILE $env(DESIGN_DEF)

if {![info exists ::env(CLK)]} {
    puts "WARNING: CLK environment variable is not set. Please set it to the name of the clock signal used in the design."
    set CLK "None"
} else {
    puts "Using clock signal from: $env(CLK)"
}

if {![info exists ::env(CLK_PERIOD)]} {
    puts "WARNING: CLK_PERIOD environment variable is not set. Please set it to the period of the clock signal used in the design."
    set CLK_PERIOD "None"
} else {
    puts "Using clock period from: $env(CLK_PERIOD)"
}

# WARNING: Set the global variable CLK and CLK_PERIOD to specify the name of the clock signal used in the design (in case no clock signal does not exist in the design then set the CLK variable to "None") and the period of the clock used in the design
set CK $env(CLK)
set PERIOD $env(CLK_PERIOD)

# --- STEP 1: Load the library files and the design to be analyzed ---
# Load the LEF files for the technology and standard cell library
load_lef $LEF_FILES
# Load the library file for the standard cell library
load_lib $LIB_FILE
# Load the Verilog file for the design to be analyzed
read_verilog $DUT
# Load the DEF file for the design to be analyzed
load_def $DEF_FILE

# --- STEP 2: Set up the clock and timing constraints ---
# If a clock signal is specified, create a clock with the specified period and set input/output delays
if { $CK != "None" } {
    puts "Creating clock: $CK with period: $PERIOD"
    create_clock -name $CK -period $PERIOD -waveform {0 [expr {$PERIOD / 2}]}
    set_input_delay 0 -clock $CK [all_inputs]
    set_output_delay $PERIOD -clock $CK [all_outputs]
} else {
    puts "No clock signal specified, skipping clock creation."
}

# --- STEP 3: Perform STA ---
# Static Timing Analysis is required to initialise the timing information of the circuit and also to levelise the graph
puts "Performing Static Timing Analysis (STA)"
report_timing

# --- STEP 4: Static Probability Annotation ---
# A default 50% probability is assigned to all circuit nodes
puts "Performing Static Probability Annotation"
set_static_probability -value 0.5 -all
# Perform Static Probability Annotation using 0-Algorithm
list_static_probabilities -significant_digits 4

# --- STEP 5: Create Particle Profiles ---
# Specify the particle profiles used during the SET Analysis
create_particle_profile -name p1 -tdelay 0 -tau1 10p -tau2 100p -q 34f
create_particle_profile -name p2 -tdelay 1p -tau1 10p -tau2 100p -q 66f
create_particle_profile -name p3 -tdelay 1p -tau1 10p -tau2 100p -q 99f
create_particle_profile -name p4 -tdelay 1p -tau1 10p -tau2 100p -q 132f

# --- STEP 6: Single Event Transient (SET) Analysis ---
# Specify the SET Analysis configuration parameters
# 0: "Vanilla" STA-mode" | 1: Detailed TimeStamp-based STA-mode | 2: Bounded TimeStamp-based STA-mode
# NOTE: Use Detailed TimeStamp-based STA-mode for more accurate results
set_SET_glitch_propagation_mode 1 
# NOTE: Use Double Exponential (DEXP) model for SET Generation
set_SET_generation_parameters -model DEXP

# Perform Exhaustive SET Analysis
puts "Performing Exhaustive SET Analysis"
log_output_to_file $REPORT_DIR/set_analysis.log
perform_exhaustive_SET_analysis -req 2
close_log_output_file

# List all gate pins SET analysis information
puts "Listing all gate pins SET analysis information"
log_output_to_file $REPORT_DIR/set_gatepins.log
report_SET_analysis_sensitivity_measurements
close_log_output_file

# --- STEP 7 (Optional): ECO SET Mitigation Techniques ---

# Apply ECO SET mitigation techniques at your wish
source Scripts/eco_set_mitigations.tcl

# --- END OF SET ANALYSIS SCRIPT ---
# quit