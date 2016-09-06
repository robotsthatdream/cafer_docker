FROM ros_indigo:v1
MAINTAINER Pierre-Henri Le Fur <lefur@edu.ece.fr>

#Install apt-add-repository support
RUN apt-get update && \
    apt-get install -y software-properties-common git vim

#Install valgrind
RUN apt-get install -y valgrind

#Add GCC 6 and Clang repositories
RUN apt-add-repository ppa:ubuntu-toolchain-r/test && \
    apt-add-repository "deb http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.8 main" && \
    wget -O - http://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add - && \
    apt-get update

#Install GCC 6 and set it as default
RUN apt-get install -y gcc-6 g++-6 && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 100 --slave /usr/bin/g++ g++ /usr/bin/g++-6 && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 20 --slave /usr/bin/g++ g++ /usr/bin/g++-4.8

#Install Clang 3.8
RUN apt-get install -y clang-3.8 clang-format-3.8

#Install catkin_tools to replace catkin_make and ease integration with QtCreator
RUN apt-get install python-catkin-tools
