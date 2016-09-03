FROM dev_tools:v1
MAINTAINER Pierre-Henri Le Fur <lefur@edu.ece.fr>

#Lib dependencies for QtCreator
RUN apt-add-repository ppa:beineri/opt-qt57-trusty && apt-get update && apt-get install -y qt57creator

USER docker_user

#Launching the container will launch QtCreator
CMD source /opt/ros/indigo/setup.bash && source /opt/qt57/bin/qt57-env.sh && sh /opt/qt57/bin/qtcreator-wrapper
