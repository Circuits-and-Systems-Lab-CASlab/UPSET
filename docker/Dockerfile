FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV QT_X11_NO_MITSHM=1
ENV UPSET_INSTALL_DIR=/opt/upset/INSTALL

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update -o Acquire::Retries=3 && \
    apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        curl \
        wget \
        unzip \
        nano \
        flex \
        bison \
        tcl8.6 \
        tcl8.6-dev \
        tk-dev \
        libgtk2.0-0 \
        libgtk2.0-dev \
        libgsl-dev \
        libsuitesparse-dev \
        libfftw3-dev \
        libreadline-dev \
        libncursesw5-dev \
        libssl-dev \
        libsqlite3-dev \
        libgdbm-dev \
        libc6-dev \
        libbz2-dev \
        libffi-dev \
        zlib1g-dev \
        libx11-6 \
        libxext6 \
        libxrender1 \
        libxtst6 \
        libxi6 \
        libxft2 \
        libfreetype6 \
        libfontconfig1 && \
    rm -rf /var/lib/apt/lists/*

COPY scripts/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

WORKDIR /opt/upset/INSTALL

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["/bin/bash"]
