FROM dev_tools:v1
MAINTAINER Pierre-Henri Le Fur <lefur@edu.ece.fr>

WORKDIR catkin_ws/src

#Get Intel TBB (dependency for CAFER)
RUN apt-get update && \
    apt-get install -y libtbb-dev

#Retrieving cafer v0.2
RUN git clone https://github.com/robotsthatdream/cafer.git && \
    cd cafer && \
    git checkout release-0.2

#Build and install CAFER
RUN source /opt/ros/indigo/setup.bash && \
    cd ../ && \
    catkin_make install -DCMAKE_INSTALL_PREFIX=../ros_packages/cafer_core/

