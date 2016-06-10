FROM ros_indigo:v1
MAINTAINER Pierre-Henri Le Fur <lefur@edu.ece.fr>

WORKDIR catkin_ws/src

#Get git
RUN apt-get update && apt-get install -y git

#Get Intel TBB library
RUN apt-get install -y libtbb-dev

#Retrieving cafer
RUN git clone https://github.com/robotsthatdream/cafer.git && cd cafer && git checkout release-0.2

#Build and install CAFER
RUN source /opt/ros/indigo/setup.bash && cd ../ && catkin_make install -DCMAKE_INSTALL_PREFIX=/usr/local

VOLUME /usr/local/share/common-lisp/ros/cafer_core
VOLUME /usr/local/share/cafer_core
VOLUME /usr/local/include/cafer_core
VOLUME /usr/local/lib/pkgconfig/cafer_core.pc
VOLUME /usr/local/lib/libcafer_core.so
VOLUME /usr/local/lib/python2.7/dist-packages/cafer_core-0.1.2.egg-info
VOLUME /usr/local/lib/python2.7/dist-packages/cafer_core

