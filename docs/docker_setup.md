# Getting Started with UPSET in Docker

This section explains the used docker filesystem while also act as a guide on how to build and use UPSET in a docker container.

## Requirements

- Folder containing precompiled UPSET (for Ubuntu 20.04) and the static libraries - **INSTALL** folder
    - Download it from GitHub [here](https://github.com/Circuits-and-Systems-Lab-CASlab/UPSET/releases/)
- [Docker](https://www.docker.com/)
- X11
- **Machine with x86_64 architecture**

!!! warning
    The docker image is built for x86_64 architecture. If you are using a different architecture, please contact us at [our mail](mailto:uth.eda.lab@gmail.com) for further assistance.

## Top Folders

| Name | Description |
| --- | --- |
| create_docker | Includes repositories for CentOS 7, Dockerfile Makefile and script that runs with docker container. **This folder is used to create docker image** |
| data | Shared folder between host and virtual machine. Includes INSTALL folder. **This folder can be used to access designs and/or scripts for UPSET** |
| use_docker | Contains Makefile and a pre-built docker image. **This folder is used to run the specific docker image** |

## Build Docker Image
| Command | Description |
| --- | --- |
| `> mkdir data` | Create the data folder |
| `> cd data` | Go to data folder |
| `> cp -r <INSTALL folder> ./` | Copy the desired INSTALL folder |
| `> cd ../create_docker` | Go to create_docker folder |
| `> make build-docker` | Build the docker image |

!!! info
    The INSTALL folder is the folder containing the UPSET executable and the static libraries.
    You can download it from [here](https://github.com/Circuits-and-Systems-Lab-CASlab/UPSET/releases).

!!! warning
    Version 1.0.0 of UPSET is not compatible with the docker setup, since it was built for CentOS 7.
    All versions of UPSET after that are built for Ubuntu 20.04 and are compatible with the docker setup.

## Run Docker Image
| Command | Description |
| --- | --- |
| `> cd ../use_docker` | Go to use_docker folder |
| `> make run` | Run the docker container |
| `> make sh` | Run in different terminal if container is already running without terminating it [optional] |

!!! warning
    Running `make run` on different terminal will remove the current container and will start a new one.
    If you want to run on different terminal then use `make sh`.
    Also, running `make sh` without prior `make run` will not work.


## Docker/VM Filesystem
| Folder | Description |
| --- | --- |
| `/home` | Home |
| `/home/data/<INSTALL folder>` | UPSET folder |
| `/home/data` | Data (Shared) Folder |