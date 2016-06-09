FROM ubuntu:14.04
MAINTAINER Pierre-Henri Le Fur <lefur@edu.ece.fr>

#Use bash as default interpreter
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

#Silence debconf complaints
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

#Get development tools (GCC, make...)
RUN apt-get update && apt-get install -y build-essential

#Lib dependencies for CLion UI
RUN apt-get install -y libgtk2.0-0 libxtst6 

#Add an user that can access the X11 socket, replace uid & gid by the output value of 'id -u $USER' and 'id -g $USER"
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/docker_user && \
    echo "docker_user:x:${uid}:${gid}:docker_user,,,:/home/docker_user:/bin/bash" >> /etc/passwd && \
    echo "docker_user:x:${uid}:" >> /etc/group && \
    echo "docker_user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/docker_user && \
    chmod 0440 /etc/sudoers.d/docker_user && \
    chown ${uid}:${gid} -R /home/docker_user

USER docker_user
WORKDIR /home/docker_user

#Copy and extract IDE archive's file from context to the container
ADD https://download.jetbrains.com/cpp/CLion-2016.1.3.tar.gz /home/docker_user

#Launching the container will launch CLion
CMD cd /home/docker_user/clion-2016.1.2/bin && ./clion.sh
