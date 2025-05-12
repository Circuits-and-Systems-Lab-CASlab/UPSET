FROM centos:centos7
ENV DEBIAN_FRONTEND=noninteractive

COPY CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo

RUN yum -y update && yum -y clean all && yum -y install gtk2+-devel gtk2-devel && yum -y install tcl &&\
    yum -y install gsl && yum -y install suitesparse && yum -y install less &\
    yum -y install xeyes && yum -y groupinstall "Development Tools"

RUN yum -y install gsl*
RUN yum -y install suitesparse*
RUN yum -y install fftw fftw-devel
RUN yum -y install libuuid libuuid-devel
RUN yum -y install readline-devel
RUN yum -y install tcl*
RUN yum -y install gtk2*
RUN yum -y install okular
RUN yum -y install nano
RUN yum -y install graphviz

WORKDIR /home/ 
COPY run_docker.sh /
CMD ["/run_docker.sh"]
