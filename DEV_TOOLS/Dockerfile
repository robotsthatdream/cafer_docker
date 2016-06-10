FROM ros_indigo:v1
MAINTAINER Pierre-Henri Le Fur <lefur@edu.ece.fr>

#Get development tools (GCC, make...)
RUN apt-get update && apt-get install -y build-essential

#Install GCC 6
RUN add-apt-repository ppa:ubuntu-toolchain-r/test && \
    apt-get update && \
    apt-get install gcc-6 g++-6 && \
    apt-get update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 10 --slave /usr/bin/g++ g++ /usr/bin/g++-6 && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 20 --slave /usr/bin/g++ g++ /usr/bin/g++-4.8




