FROM ros_indigo:v1
MAINTAINER Pierre-Henri Le Fur <lefur@edu.ece.fr>

#Install apt-add-repository support
RUN apt-get install -y software-properties-common git vim

#Install GCC 6
RUN add-apt-repository ppa:ubuntu-toolchain-r/test && \
    apt-get update && \
    apt-get install -y gcc-6 g++-6 && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 10 --slave /usr/bin/g++ g++ /usr/bin/g++-6 && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 20 --slave /usr/bin/g++ g++ /usr/bin/g++-4.8




