FROM ubuntu:14.04
MAINTAINER Pierre-Henri Le Fur <lefur@edu.ece.fr>

ARG build_env_uid=1000
ARG build_env_gid=1000

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
RUN apt-get update && apt-get install -y ros-indigo-desktop-full

#Init rosdep
RUN rosdep init

#Add an user that can access the X11 socket, replace build_env_uid & build_env_gid by the output value of 'id -u $USER' and 'id -g $USER"
RUN mkdir -p /home/docker_user && \
    echo "docker_user:x:${build_env_uid}:${build_env_gid}:docker_user,,,:/home/docker_user:/bin/bash" >> /etc/passwd && \
    echo "docker_user:x:${build_env_uid}:" >> /etc/group && \
    echo "docker_user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/docker_user && \
    chmod 0440 /etc/sudoers.d/docker_user && \
    chown ${build_env_uid}:${build_env_gid} -R /home/docker_user

USER docker_user
WORKDIR /home/docker_user

#Create ROS workspace
RUN mkdir -p /home/docker_user/catkin_ws/src

#Update rosdep
RUN rosdep update

USER root


