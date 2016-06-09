# cafer_docker
Cafer ready development environment bundled as docker images.

## Goal

Solve usual issues in development environments:
- Managing several versions of a same libraries.
- Share quickly your development environment for an experiment with others and be SURE that it works.

Others solutions:
- Virtual machines:
    - Add a great performance overhead
    - Takes a lot of space: one VM per development environment / experiment.
- Vagrant (use LXC like docker):
  - Takes a lot of space
  - The development environment is not modulable: changing a library version in the VM involves either building a new VM or deal with differents libs as on the baremetal machine.

### Docker (not VMs but containers, thanks to LXC)
- Use AUFS to share similarities between different images and save a lot of diskspace
- It is possible to build a specific library / application version in a container, expose its files to others containers so they can use it.
- The last point make it the dev environment modular: want another version of the same lib? Change the corresponding container.

## Requirements:

- Linux OS with kernel >=3.10
- [Docker-Engine >=1.10](https://docs.docker.com/engine/installation/)
- [Docker-Compose >=1.6](https://docs.docker.com/compose/install/)

## Cafer_docker images' structure

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
