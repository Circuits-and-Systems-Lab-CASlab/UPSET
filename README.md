# UPSET
UPSET is a Single Event Transient (SET) Analysis tool supporting both SET Generation and Propagation for whole circuits, based on Static Timing Analysis (STA). STA emulated signal propagation, from all timing path start points, through combinational logic to circuit endpoints, by propagating both rise/fall delays and slews and supports both the standard NLDM (Non-Linear Delay Model), as well as the more advanced CCS (Composite Current Source) timing model. By utilising CASlab's STA engine for SET generation and propagation, UPSET is able to model transient faults, originated by particles strikes, (i) with _acceptable loss of accuracy over SPICE_, and (ii) using static analysis over simulation, resulting in _many orders of magnitude speedup_.

## How to Start
All the necessary files are packaged in a tarball. The user only needs to download and extract its contents to a preferred location, then run the setup script. For more information regarding the use of UPSET, please refer to the [documentation](https://circuits-and-systems-lab-caslab.github.io/UPSET/).

## License
UPSET is released under the [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.html).

## Citation
If you use UPSET in your research, please cite the following paper:

```
@inproceedings{georgakidis2023towards,
  title={Towards a Comprehensive SET Analysis Flow for VLSI Circuits using Static Timing Analysis},
  author={Georgakidis, Christos and Valiantzas, Dimitris and Simoglou, Stavros and Lilitsis, Iordanis and Chatzivangelis, Nikolaos and Golfos, Ilias and Andjelkovic, Marko and Sotiriou, Christos and Krstic, Milos},
  booktitle={2023 IEEE International Symposium on Defect and Fault Tolerance in VLSI and Nanotechnology Systems (DFT)},
  pages={1--6},
  year={2023},
  organization={IEEE}
}
```