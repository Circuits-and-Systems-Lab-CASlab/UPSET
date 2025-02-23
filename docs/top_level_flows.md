# SET Analysis Top-Level Flows

Thus far, each of the SET Analysis (as shown [here](set_analysis_flow.md#upset-set-analysis-flow)) has been described in detail separately. This page provides a condensed description to run a complete SET analysis flow.

## SET Generation and Propagation Mode Selection

The user can select the SET analysis mode and determine the required accuracy via the following key TCL commands:

```tcl
# Set the timing model for the ASP tool
%> set_timing_model <nldm | ccs>

# Set the SET analysis mode
%> set_SET_analysis_mode <0: Vector-based | 1: Probabilistic>

# Set the SET generation parameters
%> set_SET_generation_parameters -model <DEXP | BIAS> -biascapacitance <BIAS capacitance> -recomb <recombination current> -fermi <fermi constant>

# Set SET propagation mode
%> set_SET_glitch_propagation_mode <0: Vanilla STA-mode | 1: Detailed TimeStamp-based STA-mode | 2: Bounded TimeStamp-based STA-mode>
```

Each mode or parameter has its own prerequisites and can be reviews at the related section [SET Analysis](set_analysis_flow.md#set-analysis), [SET Glitch Generation](set_analysis_flow.md#set-glitch-generation) and [SET Glitch Propagation](set_analysis_flow.md#set-glitch-propagation) respectively.

## Automated SET Profile Analysis

The user is able to run a more comprehensive SET analysis, either for  the whole circuit or by selecting some critical gates and an exclusive set of applied particle profiles.

### Exhaustive Circuit SET Analysis

Based on every defined particle profile, an exhaustive SET analysis can be performed using the TCL command:

```tcl
%> perform_exhaustive_SET_analysis
```

In the exhaustive SET analysis flow, for every defined particle profile, SET scenarios are created targeting the output pins of every circuit's gate. Then for each defined SET scenario, SET Generation and Propapagation are performed. The hierarchy of this analysis can be summarsed as follows:

```python
for each profile in SET_Particle_Profiles(all):
    for each output_gatepin in Gatepins(all):
        create_SET_scenario(profile, output_gatepin)

generate_all_SET_scenarios_glitch
propagate_all_SET_scenarios_glitch
```

### "Fast" Circuit SET Analysis

Alternatively, the user can select a specific set of output gatepins and a particle profiles using the TCL command:

```tcl
%> perform_SET_analysis -profiles {<profile1> <profile2> ...} -gatepins {<gatepin1> <gatepin2> ...}
```

Similarly to the exhaustive SET analysis, a complete SET analysis of glitch generation and propagation is performed, but only for the given particle profiles and gatepins. Thus, this approach provides more control for the user, because he can manipulate the scale of the SET analysis as he sees fit. The hierarchy of this SET analysis can be summarised with the following pseudocode:

```python
for each profile in SET_Particle_Profiles(user):
    for each gatepin in Gatepins(user):
        create_SET_scenario(profile, gatepin)

generate_all_SET_scenarios_glitch
propagate_all_SET_scenarios_glitch
```

### Custom (ECO) SET Scenario Analysis

Additionally, the user can examine particular generation and propagation scenario(s) using the following sequence of TCL commands:

```tcl
%> generate_SET_scenario_glitch (-scenario <scenario_index> | -all) ?-corner <corner_index>?

%> propagate_SET_scenario_glitch (-scenario <scenario_index> | -all) ?-corner <corner_index>?
```

For more details regarding the ECO capabilities, refer to [Appendix A](appendix.md#appendix-a-eco-set-analysis).

### Report and Result Collection

The TCL commands that enable the user to verify and validate the SET analysis results are summarised below:

- SET **Generation** TCL Commands(s) for Report:
    - [`list_particle_profiles`](commands_reference.md#list_particle_profiles)
    - [`list_SET_scenarios`](commands_reference.md#list_set_scenarios)
    - [`list_SET_scenario_case_analysis`](commands_reference.md#list_set_scenario_case_analysis)
    - [`report_SET_generation_probabilities`](commands_reference.md#report_set_generation_probabilities)
- SET **Propagation** TCL Commands(s) for Report:
    - [`report_SET_scenario_timingpoints`](commands_reference.md#report_set_scenario_timingpoints)
- **Overview** of SET Analysis TCL Commands(s) for Report:
    - [`list_static_probabilities`](commands_reference.md#list_static_probabilities)
    - [`list_saif_info`](commands_reference.md#list_saif_info)
    - [`list_all_gatepins_set_analysis_info`](commands_reference.md#list_all_gatepins_set_analysis_info)
    - [`list_gatepin_set_analysis_info`](commands_reference.md#list_gatepin_set_analysis_info)

As mentioned in the section [Error Reporting and Bugs](tool_fundamentals.md#error-reporting-and-bugs), the output of the tool can be report using the `tee` Bash command while running UPSET:

```bash
%> <UPSET> | tee <log_file>
```

Alternatively, the output of a specific TCL command(s) can be redirected by enclosing it as follows:

```tcl
%> log_output_to_file <log_file>
%> # ..... TCL commands .....
%> close_log_output_file
```
