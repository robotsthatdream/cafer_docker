FROM terminator:v1
MAINTAINER Pierre-Henri Le Fur <lefur@edu.ece.fr>

USER root

#Lib dependencies for QtCreator
RUN apt-add-repository ppa:beineri/opt-qt57-trusty && \
    apt-get update && \
    apt-get install -y qt57creator

USER docker_user

RUN shell_config_file=.${SHELL#/bin/}rc && \
    printf "\nsource /opt/qt57/bin/qt57-env.sh" >> $shell_config_file
