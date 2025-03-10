# Appendices

## Appendix A: ECO SET Analysis

Beyond the SET Analysis Flow presented in page [UPSET SET Analysis Flow](set_analysis_flow.md#upset-set-analysis-flow) the user can perform ECO SET Analysis, by generating and propagation custom SET pulses.

### A.1 ECO SET Generation

A custom SET glitch can be generated by providing the `drivergatepin` (where the strike happened), and `endpoint` (where the measurements are taken) and the DEXP current source parameters (`tdelay`, `tau1`, `tau2`, `q`), using the TCL command:

```tcl
%> generate_SET_glitch -scenario <drivergatepin> <endpoint> <tdelay> <tau1> <tau2> <q> -corner <corner_index>
```
, where the argument `-scenario` specifies the scenario characteristics and the argument `-corner` specifies the library corner to be used for the SET glitch generation.

### A.2 ECO SET Propagation

Propagating a custom SET pulse from a specified input gatepin to the forward logic cone can be done using the TCL command:

```tcl
%> propagate_SET_glitch -gatepin <receivergatepinname> -rise {risearrival_1 riseslew_1 ... risearrival_N riseslew_N} -fall {fallarrival_1 fallslew_1 ... fallarrival_N fallslew_N} ?-corner <corner_index>?
```

, where the argument `-gatepin` specifies the name of the input gatepin from where the SET propagation starts and the arguments `-rise` and `-fall` specify the lists of rise/fall arrival times and slews which specify the SET pulse to be propagated.

## Appendix B: Custom Simulation

### B.1 Simulation

To simulate a pulse for a given net, a supply is needed, which can be either a voltage or current source. The supply can be either described using a transient specification. Currently, the supported transient specifications are Piece-Wise Linear (**PWL**), and Double Exponential (**DEXP**). Also, arguments for the aforementioned Transient specifications are needed. Also, the given name for the supply, either starting with "V" or "I", specified the type of the supply (like SPICE voltage sources start with "V", whereas current sources start with "I").

Creating a net supply can be done using the following TCL command:

```tcl
%> set_net_supply <supplyname> <drivergatepin> <groundname> <transientspec> {<transientspec args>}
```

, where the argument `{<transientspec args>}` is used to specify the arguments for the transient specification of the supply. A PWL supply is specified by using a list of time and voltage sets, whereas a DEXP supply is specified using a list of the Double Exponential Current Source model arguments (tdelay, tau1, tau2, q).

!!! example
    PWL list example: `{1n 0 1.5n 0 2n 0.7 2.5n 0.7 3n 0}`

    DEXP list example: `{0.5n 47p 647p 282f}`

Running a custom SPICE simulation in a specified net, with the beforehand specified supply can be done using the TCL command:

```tcl
%> simulate_net <driver_gatepin>
```

UPSET simulation is performed using a predefined time step and total duration. These parameters can be specified using the TCL command:

```tcl
%> set_spice_simulation_parameters -timestep <timestepvalue> -totalduration <totaldurationvalue>
```

### B.2 Node Measurements

To measure the voltage and/or the current of the generated SET glitch to a specified node, SPICE probes are used, which store the SPICE simulation data. Voltage probes are specified at a single node with reference to GND, while current probes are specified at net supplies. After the simulation, the data are stored in the probes and they can be plotted to see the current or voltage waveform.

Creating a SPICE probe can be done using the TCL command:

```tcl
%> create_net_spice_probe <drivergatepin> (-node <spefnodename> | -vsource <voltagesourcename> | -all) ?-longest | -shortest?
```

and it can be plotted using the TCL command:

```tcl
%> plot_spice_probe {probelist}
```

The list of the defined SPICE probes can be reported using the TCL command:

```tcl
%> list_spice_probes
``` 