# UPSET

<p align="center">
  <img src="docs/assets/UPSET_logo.png" />
</p>


## Table of Contents
- [UPSET](#upset)
  - [Table of Contents](#table-of-contents)
  - [Acknowledgements](#acknowledgements)
  - [What is UPSET?](#what-is-upset)
  - [Running UPSET with Docker](#running-upset-with-docker)
  - [DEMO](#demo)
  - [Related Publications](#related-publications)
  - [Citation](#citation)

## Acknowledgements

Special thanks to IHP Microelectronics for their financial support during the development of UPSET.

<p align="center">
  <img src="docs/assets/caslab_ihp_collaboration.png" />
</p>


UPSET developement as well as its integration with other circuit reliability tools will be continued during the next years as part of the [TWINRELECT](https://twin-relect.uth.gr/) Europen project.

<p align="center">
  <img src="docs/assets/twin-relect_logo.png" />
</p>

## What is UPSET?

UPSET is a Single Event Transient (SET) Analysis tool supporting both SET Generation and Propagation for whole circuits, based on Static Timing Analysis (STA). STA emulated signal propagation, from all timing path start points, through combinational logic to circuit endpoints, by propagating both rise/fall delays and slews and supports both the standard NLDM (Non-Linear Delay Model), as well as the more advanced CCS (Composite Current Source) timing model. By utilising CASlab's STA engine for SET generation and propagation, UPSET is able to model transient faults, originated by particles strikes, (i) with _acceptable loss of accuracy over SPICE_, and (ii) using static analysis over simulation, resulting in _many orders of magnitude speedup_.

## Running UPSET with Docker

> [!WARNING]
> Version 1.0.0 of UPSET was built for CentOS 7. All versions of UPSET after that are built for Ubuntu 20.04 and are compatible with the docker setup.
> Moreover, UPSET executable and the docker setup are compatible ONLY with x86_64 architectures. If you are using a different architecture, please contact us at [our mail](mailto:uth.eda.lab@gmail.com) for further assistance.

This repository provides a Docker Compose based workflow. The UPSET release is downloaded automatically from GitHub releases and extracted into the local `.upset/` directory. The executable is then mounted inside the container under `/opt/upset/INSTALL`.

The user workspace is mounted under `/workspace` and contains the design files, scripts, PDKs, reports, and environment configuration.

A typical project structure is:

```text
.
├── docker/
│   ├── Dockerfile
│   ├── docker-entrypoint.sh
│   └── fetch-upset.sh
├── docker-compose.yml
├── Makefile
└── workspace/
    ├── pdks/
    ├── reports/
    ├── scripts/
    ├── setvars.sh
    └── testcases/
```

To run the container, use the following command from the Makefile:

```cmd
make run
```

## DEMO
Below there is a demo video of perfoming an exhaustive SET analysis in UPSET.

<video src="https://github.com/user-attachments/assets/3d5a8ced-c762-4319-b15e-38494c769b65
" controls="controls" width="100%"></video>

A higher definition of the demo can be found in [Youtube](https://youtu.be/6DBn7oiXmvQ)

## Related Publications
Below you can find a list of the publications that are related to UPSET engine.

- [Towards a Comprehensive SET Analysis Flow for VLSI Circuits using Static Timing Analysis](https://doi.org/10.1109/DFT59622.2023.10313533)
   - **Authors**: Christos Georgakidis, Dimitris Valiantzas, Stavros Simoglou, Iordanis Lilitsis, Nikolaos Chatzivangelis, Ilias Golfos, Marko Andjelkovic, Christos Sotiriou, Milos Krstic
   - **Conference**: 2023 IEEE International Symposium on Defect and Fault Tolerance in VLSI and Nanotechnology Systems (DFT)
- [UPSET: A Comprehensive Probabilistic Single Event Transient Analysis Flow for VLSI Circuits Using Static Timing Analysis](https://www.mdpi.com/2079-9292/15/4/818)
   - **Authors**: Christos Georgakidis, Dimitris Valiantzas, Nikolaos Chatzivangelis, Marko Andjelkovic, Christos Sotiriou, Milos Krstic
   - **Journal**: MDPI Electronics, Special Issue: Single-Event Effects: Modeling, Prediction, Testing and Radiation Hardening 

## Citation
If you use UPSET in your research, please cite the following paper(s):

```
@inproceedings{georgakidis2023towards,
  title={Towards a Comprehensive SET Analysis Flow for VLSI Circuits using Static Timing Analysis},
  author={Georgakidis, Christos and Valiantzas, Dimitris and Simoglou, Stavros and Lilitsis, Iordanis and Chatzivangelis, Nikolaos and Golfos, Ilias and Andjelkovic, Marko and Sotiriou, Christos and Krstic, Milos},
  booktitle={2023 IEEE International Symposium on Defect and Fault Tolerance in VLSI and Nanotechnology Systems (DFT)},
  pages={1--6},
  year={2023},
  organization={IEEE}
}

@Article{electronics15040818,
  AUTHOR = {Georgakidis, Christos and Valiantzas, Dimitris and Chatzivangelis, Nikolaos and Andjelkovic, Marko and Sotiriou, Christos and Krstic, Milos},
  TITLE = {UPSET: A Comprehensive Probabilistic Single Event Transient Analysis Flow for VLSI Circuits Using Static Timing Analysis},
  JOURNAL = {Electronics},
  VOLUME = {15},
  YEAR = {2026},
  NUMBER = {4},
  ARTICLE-NUMBER = {818},
  URL = {https://www.mdpi.com/2079-9292/15/4/818},
  ISSN = {2079-9292},
  DOI = {10.3390/electronics15040818}
}
```
