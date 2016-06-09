FROM ubuntu:14.04
MAINTAINER Pierre-Henri Le Fur <lefur@edu.ece.fr>

#Use bash as default interpreter
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

#Silence debconf complaints
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

## Retrieve wget
RUN apt-get update && apt-get install -y wget

#Add universe and multiverse repositories
RUN printf "deb http://us.archive.ubuntu.com/ubuntu/ trusty universe\ndeb-src http://us.archive.ubuntu.com/ubuntu/ trusty universe\ndeb http://us.archive.ubuntu.com/ubuntu/ trusty-updates universe\ndeb-src http://us.archive.ubuntu.com/ubuntu/ trusty-updates universe\ndeb http://us.archive.ubuntu.com/ubuntu/ trusty multiverse\ndeb-src http://us.archive.ubuntu.com/ubuntu/ trusty multiverse\ndeb http://us.archive.ubuntu.com/ubuntu/ trusty-updates multiverse\ndeb-src http://us.archive.ubuntu.com/ubuntu/ trusty-updates multiverse" >> /etc/apt/sources.list

#Add ROS Indigo repository
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

RUN wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -

#RUN apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv-key 0xB01FA116

#Install ROS Indigo
RUN apt-get update && apt-get install -y ros-indigo-desktop

#Init rosdep
RUN rosdep init && rosdep update

#Create ROS workspace
RUN mkdir -p /home/docker_user/catkin_ws/src
