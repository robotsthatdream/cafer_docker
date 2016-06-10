FROM ros_indigo:v1
MAINTAINER Pierre-Henri Le Fur <lefur@edu.ece.fr>

#Lib dependencies for CLion UI
RUN apt-get install -y libgtk2.0-0 libxtst6 

USER docker_user

#Copy and extract IDE archive's file from context to the container
ADD https://download.jetbrains.com/cpp/CLion-2016.1.3.tar.gz /home/docker_user

#Launching the container will launch CLion
#CMD cd /home/docker_user/clion-2016.1.2/bin && ./clion.sh
