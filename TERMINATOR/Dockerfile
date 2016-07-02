FROM dev_tools:v1
MAINTAINER Pierre-Henri Le Fur <lefur@edu.ece.fr>

#Install Terminator and dependencies (including gtk2 and python 2.7)
RUN apt-get update && \
    add-apt-repository ppa:gnome-terminator && \
    apt-get update && \
    apt-get install -y terminator

USER docker_user

#Launching the container will launch Terminator
CMD source /opt/ros/indigo/setup.bash && terminator
