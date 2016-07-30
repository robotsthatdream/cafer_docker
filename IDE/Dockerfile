FROM dev_tools:v1
MAINTAINER Pierre-Henri Le Fur <lefur@edu.ece.fr>

#Lib dependencies for CLion UI
RUN apt-get install -y libgtk2.0-0 libxtst6 

USER docker_user

#Copy and extract IDE archive's file from context to the container
RUN wget -qO- https://download.jetbrains.com/cpp/CLion-2016.2.tar.gz \
    | tar --transform 's/^dbt2-0.37.50.3/dbt2/' -xvz

#Launching the container will launch CLion
CMD source /opt/ros/indigo/setup.bash && cd /home/docker_user/clion-2016.2/bin && ./clion.sh
