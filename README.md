# cafer_docker
Cafer ready development environment bundled as docker images.

## Requirements:

- Linux OS with kernel >=3.10
- [Docker-Engine >=1.10](https://docs.docker.com/engine/installation/)
- [Docker-Compose >=1.6](https://docs.docker.com/compose/install/)

## Docker images' structure

![Docker compose view](http://gdurl.com/prtp)

## How-to

To launch the development environment, you need:
- To create the folder structure /home/$USER/DockerData/catkin_ws/src 
  If you want another folder to sync data between your dev environment and the host, edit the corresponding line in the docker-compose.yml file.
  > ide_data:
      build: ./IDE_data
      image: ide_data:v1
      volumes:
        - /THE_HOST_PATH_YOU_WANT:/home/docker_user/catkin_ws/src
        - /home/docker_user/catkin_ws
      command: chown -R 1000:1000 /home/docker_user/catkin_ws
- To run the environment, just do:
  > sudo docker-compose up
