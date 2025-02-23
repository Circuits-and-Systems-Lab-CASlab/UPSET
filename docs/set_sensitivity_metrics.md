# SET Sensitivity Metrics

After the SET Analysis is completed a list of sensitivity metrics both for the whole circuit as well as each circuit gatepin are expected.

## Accumulated SETs (ASET)

For each endpoint of the circuit, i.e. Primary Output (PO) and Flip-Flop Input, the total number of SETs reached is computed. However, since the arrival of a SET is associated with its SET probability, then the accumulated number of SETs for an endpoint $e$ and a specified SET scenario $s$, $ASET(e,s)$ is computed as follows:

$$
ASET(e, s) = \sum_{p}^{\#pulses}P_{SET}(e, s)
$$

In addition, the accumulated number of SETs for an endpoint $e$, considering all the SET scenarios that reached this endpoint, is computed as:

$$
ASET(e) = \sum_{s}^{\#scenarios}ASET(e,s)
$$

Finally, the total number of accumulated SETs reaching all the endpoints of the circuit is computed as:

$$
ASET_{total} = \sum_{e}^{\#endpoints}ASET(e)
$$

and the average one as well:

$$
ASET_{avg} = \frac{\sum_{e}^{\#endpoints}ASET(e)}{\#endpoints}
$$

## Latched Accumulated SETs (LASET)

Considering the effect of timing-window masking, similarly to ASET, the Latched Accumulated SETs (LASET) for an endpoint $e$ and a specified SET scenario $s$, $LASET(e,s)$ is computed as follows:

$$
    LASET(e, s) = \sum_{p}^{\#pulses}P_{SET}(e, s)\times \frac{PW - W_{Latching}}{P_{clock}}
$$

Similarly to ASET, the LASET for a specified endpoint $e$ considering all the SET scenarios that reached this endpoint is computed as:

$$
    LASET(e) = \sum_{s}^{\#scenarios}LASET(e,s)
$$

Finally, the total number of accumulated SETs reaching all the endpoints of the circuit is computed as:

$$
    LASET_{total} = \sum_{e}^{\#endpoints}LASET(e)
$$

and the average one as well:

$$
    LASET_{avg} = \frac{\sum_{e}^{\#endpoints}LASET(e)}{\#endpoints}
$$

## Accumulated Pulse Width (APW)

In addition to the Accumulated (Latched) SETs which is the sum of probabilities for all the SETs reaching a circuit endpoint, the accumulated PW per endpoint is also calculated. The Accumulated Pulse Width (APW) for an endpoint $e$ and a specified SET scenario $s$, $APW(e,s)$ is computed as follows:

$$
    APW(e,s) = \sum_{p}^{\#pulses}PW(e,s)
$$

In addition, the accumulated PW of the SETs reaching an endpoint $e$, considering all the SET scenarios that reached the endpoint, is computed as:

$$
    APW(e) = \sum_{s}^{\#scenarios}APW(e,s)
$$

Finally, the total accumulated PW of SETs reaching all the circuit endpoints is computed as follows:

$$
    APW_{total} = \sum_{e}^{\#endpoints}APW(e)
$$

and the average one as well:

$$
    APW_{avg} = \frac{\sum_{e}^{\#endpoints}APW(e)}{\#endpoint}
$$

## Component Sensitivity Metrics

In addition to the ASET for endpoints and the whole circuit, a list of sensitivity metrics for each circuit gatepin. These metrics can be used by the designer to target gates during SET-driven optimisations

### Impact Ratio ($IR$)

The **Impact Ratio** ($IR$) for an output gatepin $g_i$ is defined as the ratio of the number of affected endpoints (POs and FF inputs) by a SET pulse generated at $g_i$ over the number of reachable endpoints.

Thus, for an output gatepin $g_i$ and a defined SET scenario targeting $g_i$, the Impact Ratio is computed as follows:

$$
    IR(s, g_i) = \frac{affected\_endpoints(s, g_i)}{reachable\_endpoints(g_i)}
$$

For the gatepin $g_i$, also the worst $IR$ among all the SET scenarios targeting $g_i$ is computed as:

$$
    worstIR(g_i) = \max_{s}^{\#scenarios}\{IR(s, g_i)\}
$$

### Maximum Pulse Width ($MPW$)

The Maximum Pulse Width ($MPW$) for a gatepin $g_i$ is the maximum pulse width over all the SET pulses reaching this gatepin.

For a gatepin $g_i$ and a specified SET scenario $s$, the Maximum Pulse Width is computed as follows:

$$
    MPW(s, g_i) = \max_{p}^{arriving_pulses}\{PW(p, s, g_i)\}
$$

Also the worst $MPW$ among all the SET scenarios that reach the gatepin $g_i$ is computed:

$$
    worstMPW(g_i) = \max_{s}^{\#scenarios}\{MPW(s, g_i)\}
$$


### Broadening Factor ($BF$)

A SET pulse traversing through a gate can be either broadened or attenuated based on the effect of the gate. Thus, for each output gatepin of the circuit the Broadening Factor ($BF$) is computed as the ratio of the maximum pulse width among the SET pulses appeared at the output of the gate over the maximum pulse width among the input SET pulses.

Thus, for an output gatepin $g_i$ and a defined SET scenario $s$, the broadening factor can be computed as follows:

$$
    BF(s, g_i) = \frac{\max_{p}^{output\_pulses}\{PW(p, s, g_i)\}}{\max_{p}^{input\_pulses}\{PW(p, s, g_i)\}}
$$

Also the worst $BF$ among all the SET scenarios is computed:

$$
    worstBF(g_i) = \max_{s}^{\#scenarios}\{BF(s, g_i)\}
$$

If $BF > 1$, then the gate results in SET pulse broadening, and, thus, it is more critical for the total circuit sensitivity. Otherwise, if $BF < 1$, then the SET pulse traversing through this gate is attenuated, and the gate reduces the impact of SET.

### SET Generation Probability ($P_{gen}$)

Among the above SET sensitivity metrics related to the SET propagation, the gate sensitivity related to its resistance to generate a SET pulse must be defined. Thus for each output gatepin of the circuit, the SET Generation Probability is defined, both for positive ($P_{gen}^{POS}$) and negative SET pulse generation ($P_{gen}^{NEG}$). The reason behind separating positive and negative SET pulse generation probability is that a gate might be more resistant to generating SET pulses in one direction over the other.

Thus, for an output gatepin $g_i$ of the circuit, the positive and negative SET pulse generation probability can be defined as follows:

$$
    P_{gen}^{POS}(g_i) = P_0^{static}(g_i) \times \frac{\# \text{Successful SET Generations}}{\# \text{SET Generations Attempts}}
$$

$$
    P_{gen}^{NEG}(g_i) = P_1^{static}(g_i) \times \frac{\# \text{Successful SET Generations}}{\# \text{SET Generations Attempts}}
$$

