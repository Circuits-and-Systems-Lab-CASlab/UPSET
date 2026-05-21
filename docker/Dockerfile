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

# Build legacy libpng15 required by UPSET bundled freetype/runtime
# ARG LIBPNG15_VERSION=1.5.30

# RUN curl -fsSL "https://download.sourceforge.net/libpng/libpng-${LIBPNG15_VERSION}.tar.gz" \
#         -o /tmp/libpng-${LIBPNG15_VERSION}.tar.gz && \
#     tar -xzf /tmp/libpng-${LIBPNG15_VERSION}.tar.gz -C /tmp && \
#     cd /tmp/libpng-${LIBPNG15_VERSION} && \
#     ./configure --prefix=/opt/libpng15 && \
#     make -j"$(nproc)" && \
#     make install && \
#     echo "/opt/libpng15/lib" > /etc/ld.so.conf.d/libpng15.conf && \
#     ldconfig && \
#     rm -rf /tmp/libpng-${LIBPNG15_VERSION} /tmp/libpng-${LIBPNG15_VERSION}.tar.gz

COPY docker/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["/bin/bash"]
