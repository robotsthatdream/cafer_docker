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
RUN source /opt/ros/indigo/setup.bash && cd ../ && catkin_make install -DCMAKE_INSTALL_PREFIX=/usr/local/cafer

VOLUME /usr/local/cafer

