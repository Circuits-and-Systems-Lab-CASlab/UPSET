FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
ARG APT_COMMAND="apt-get -o Acquire::Retries=3 -y"
ARG python_version="python3"
ARG tf_agents_version="tf-agents[reverb]"

ARG APT_COMMAND="apt-get -o Acquire::Retries=3 -y"

# Basic Dev && ASP Depedencies
RUN ${APT_COMMAND} update && ${APT_COMMAND} install build-essential &&\
    ${APT_COMMAND} install gtk2.0 && ${APT_COMMAND} install libgtk2.0-dev &&\
    ${APT_COMMAND} install tcl8.6 && ${APT_COMMAND} install libgsl-dev &&\
    ${APT_COMMAND} install libsuitesparse-dev && ${APT_COMMAND} install libfftw3-dev &&\
    ${APT_COMMAND} install libreadline-dev 
 

RUN ${APT_COMMAND} install flex && ${APT_COMMAND} install bison

RUN ${APT_COMMAND} install tcl8.6-dev


RUN ${APT_COMMAND} install software-properties-common wget checkinstall && \
    ${APT_COMMAND} install libreadline-gplv2-dev libncursesw5-dev libssl-dev \
    libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev 

WORKDIR /
COPY run_docker.sh /
CMD ["/run_docker.sh"]
