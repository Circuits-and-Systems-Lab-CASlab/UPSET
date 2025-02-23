# Supported TCL Commands
<table markdown>
<thead markdown>
<tr style="background-color: rgb(179 179 255);">
<th style="text-align: center;">Command</th>
<th style="text-align: center;">Description</th>
</tr>
</thead>
<tbody markdown>
<tr style="background-color: rgb(209 211 212);">
<td style="text-align: center;" colspan="2"><b>Leaving UPSET</b></td>
</tr>
<tr>
<td style="font-family: 'Courier New';">quit</td>
<td>Quit UPSET tool</td>
</tr>
<tr style="background-color: rgb(209 211 212);">
<td style="text-align: center;" colspan="2"><b>Import Files</b></td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [load_lef](commands_reference.md#load_lef)</td>
<td>Load LEF technology file</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [load_lib](commands_reference.md#load_lib)</td>
<td>Load LIB Timing Library file</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [load_verilog](commands_reference.md#load_verilog)</td>
<td>Load Verilog netlist</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [load_spef](commands_reference.md#load_spef)</td>
<td>Load parasitics SPEF file</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [load_saif](commands_reference.md#load_saif) / [read_saif](commands_reference.md#read_saif)</td>
<td>Load Switching Activity (SAIF) file</td>
</tr>
<tr style="background-color: rgb(209 211 212);">
<td style="text-align: center;" colspan="2"><b>Tool Configuration</b></td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [set_timing_model](commands_reference.md#set_timing_model)</td>
<td>Select timing model</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [set_timing_RC_mode](commands_reference.md#set_timing_RC_mode)</td>
<td>Select interconnect timing model</td>
</tr>
<tr style="background-color: rgb(209 211 212);">
<td style="text-align: center;" colspan="2"><b>Set Simulation Parameters</b></td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [set_spice_simulation_parameters](commands_reference.md#set_spice_simulation_parameters)</td>
<td>Set SPICE simulation parameters</td>
</tr>
<tr style="background-color: rgb(209 211 212);">
<td style="text-align: center;" colspan="2"><b>SDC Constraints</b></td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [create_clock](commands_reference.md#create_clock)</td>
<td>Create clock</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [set_input_delay](commands_reference.md#set_input_delay)</td>
<td>Set design input delay constraint</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [set_output_delay](commands_reference.md#set_output_delay)</td>
<td>Set design output delay constraint</td>
</tr>
</tr>
<tr style="background-color: rgb(209 211 212);">
<td style="text-align: center;" colspan="2"><b>Static Timing Analysis</b></td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [report_timing](commands_reference.md#report_timing)</td>
<td>Perform STA</td>
</tr>
</tr>
<tr style="background-color: rgb(209 211 212);">
<td style="text-align: center;" colspan="2"><b>Simulation</b></td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [set_net_supply](commands_reference.md#set_net_supply)</td>
<td>Create a SPICE supply</td>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [simulate_net](commands_reference.md#simulate_net)</td>
<td>Perform SPICE simulation</td>
</tr>
</tr>
<tr style="background-color: rgb(209 211 212);">
<td style="text-align: center;" colspan="2"><b>SET Generation</b></td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [generate_SET_glitch](commands_reference.md#generate_SET_glitch)</td>
<td>Generate SET glitch and report rise and fall edges slew and arrivals</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [create_particle_profile](commands_reference.md#create_particle_profile)</td>
<td>Create a particle profile</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [delete_particle_profile](commands_reference.md#delete_particle_profile)</td>
<td>Delete specified particle profile</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [clear_particle_profiles_info](commands_reference.md#clear_particle_profiles_info)</td>
<td>Clear all particle profiles information</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [list_particle_profiles](commands_reference.md#list_particle_profiles)</td>
<td>List all particle profiles info</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [list_cubes_propagating_input_SETs_to_output](commands_reference.md#list_cubes_propagating_input_SETs_to_output)</td>
<td>List all cubes propagating input SETs to output</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [create_SET_scenario](commands_reference.md#create_SET_scenario)</td>
<td>Create a SET scenario</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [load_SET_scenarios](commands_reference.md#load_SET_scenarios)</td>
<td>Load SET scenario file</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [list_SET_scenarios](commands_reference.md#list_SET_scenarios)</td>
<td>List specified SET scenario information</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [list_SET_scenarios](commands_reference.md#list_SET_scenarios)</td>
<td>List all stored SET scenarios information</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [clear_SET_scenarios](commands_reference.md#clear_SET_scenarios)</td>
<td>Remove all stored SET scenarios</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [generate_SET_scenario_glitch](commands_reference.md#generate_SET_scenario_glitch)</td>
<td>Generate SET glitch for the specified scenario or all scenarios loaded in memory</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [set_SET_generation_parameters](commands_reference.md#set_SET_generation_parameters)</td>
<td>Set SET generation model. For BIAS model capacitance Cs, Recombination Currents and Fermi constants parameters can be specified</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [generate_SET_scenario_custom_glitch](commands_reference.md#generate_SET_scenario_custom_glitch)</td>
<td>Generate SET glitch scenario as a PWL voltage waveform for the specified receive gatepin</td>
</tr>
</tr>
<tr style="background-color: rgb(209 211 212);">
<td style="text-align: center;" colspan="2"><b>Nodes Measurements</b></td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [create_net_spice_probe](commands_reference.md#create_net_spice_probe)</td>
<td>Create a SPICE probe for the specified net</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [plot_spice_probe](commands_reference.md#plot_spice_probe)</td>
<td>Plot the specified probe data</td>
</tr>
</tr>
<tr style="background-color: rgb(209 211 212);">
<td style="text-align: center;" colspan="2"><b>SET Propagation</b></td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [propagate_SET_glitch](commands_reference.md#propagate_SET_glitch)</td>
<td>Propagate SET glitch and report measurements</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [propagate_SET_scenario_glitch](commands_reference.md#propagate_SET_scenario_glitch)</td>
<td>Propagate SET glitch for the specified scenario or all scenarios loaded in memory</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [set_SET_glitch_propagation_mode](commands_reference.md#set_SET_glitch_propagation_mode)</td>
<td>Set SET glitch propagation mode. "Vanilla" mode is represented as 0, Detailed TimeStamp-based as 1, and Bounded TimeStamp-based as 2</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [set_SET_analysis_mode](commands_reference.md#set_SET_analysis_mode)</td>
<td>Set SET analysis mode. Vector-based is represented as 0, and Probabilistic as 1</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [perform_SET_analysis](commands_reference.md#perform_SET_analysis)</td>
<td>Perform fast SET analysis for the specified gatepins or all gatepins loaded in memory</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [perform_exhaustive_SET_analysis](commands_reference.md#perform_exhaustive_SET_analysis)</td>
<td>Perform exhaustive SET analysis, i.e. for all circuit gatepins and particle profiles combinations</td>
</tr>
<tr style="background-color: rgb(209 211 212);">
<td style="text-align: center;" colspan="2"><b>Logical Masking</b></td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [create_SET_scenario_case_analysis](commands_reference.md#create_SET_scenario_case_analysis)</td>
<td>Create SET scenario case analysis</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [list_SET_scenario_case_analysis](commands_reference.md#list_SET_scenario_case_analysis)</td>
<td>List SET scenario case analysis information</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [clear_SET_scenario_case_analysis](commands_reference.md#clear_SET_scenario_case_analysis)</td>
<td>Remove SET scenario case analysis information</td>
</tr>
<tr style="background-color: rgb(209 211 212);">
<td style="text-align: center;" colspan="2"><b>Static Probabilities</b></td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [list_saif_info](commands_reference.md#list_saif_info)</td>
<td>List SAIF information</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [set_static_probability](commands_reference.md#set_static_probability)</td>
<td>Set the static probability value for the specified gatepin(s)</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [reset_static_probabilities](commands_reference.md#reset_static_probabilities)</td>
<td>Reset static probabilities</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [list_static_probabilities](commands_reference.md#list_static_probabilities)</td>
<td>Propagate and list static probabilities stored in memory</td>
</tr>
<tr style="background-color: rgb(209 211 212);">
<td style="text-align: center;" colspan="2"><b>Component Sensitivity Metrics</b></td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [list_gatepin_set_analysis_info](commands_reference.md#list_gatepin_set_analysis_info)</td>
<td>List SET analysis information for the specified gatepin</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [list_all_gatepin_set_analysis_info](commands_reference.md#list_all_gatepin_set_analysis_info)</td>
<td>List SET analysis information for all gatepins</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [report_SET_scenario_timingpoints](commands_reference.md#report_SET_scenario_timingpoints)</td>
<td>Report SET scenario timingpoints</td>
</tr>
<tr markdown>
<td style="font-family: 'Courier New';" markdown> [report_SET_generation_probabilities](commands_reference.md#report_SET_generation_probabilities)</td>
<td>Report SET generation probabilities for all gatepins</td>
</tr>
</tbody>
</table>