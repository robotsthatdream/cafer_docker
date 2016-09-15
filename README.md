# cafer_docker
Cafer ready development environment bundled as docker images.

## Goal

Solve usual issues in development environments:
- Managing several versions of a same libraries.
- Share quickly your development environment for an experiment with others and be SURE that it works.

Others solutions:
- **Virtual machines**:
    - Add a great performance overhead
    - Takes a lot of space: one VM per development environment / experiment.
- **Vagrant**:
  - Takes a lot of disk space
  - The development environment is not modulable: changing a library version in the VM involves either building a new VM or deal with differents libs as on the baremetal machine.

### **Docker**
- It builds containers using isolation features from the Linux kernel. Containers act as virtual machines without the performance overhead.
- Use AUFS to share similarities between different images and save a lot of diskspace
- It is possible to build a specific library / application version in a container, expose its files to others containers so they can use it.
- The last point make it the dev environment modular: want another version of the same lib? Change the corresponding container.

### Regarding Docker-Compose

The same project could be achieved without Docker-Compose, as if one look at the [docker-compose.yml file](https://github.com/robotsthatdream/cafer_docker/blob/master/docker-compose.yml),
the instructions of the yaml file come from the *docker run* and *docker build* tools. Docker-Compose just makes this task way easier.

**⚠** Please note that Docker-Compose instructions have precedence over similar instructions put in a Dockerfile.

## Requirements:

- Linux OS with kernel >=3.10
- [Docker-Engine >=1.10](https://docs.docker.com/engine/installation/)
- [Docker-Compose >=1.6](https://docs.docker.com/compose/install/)

## Content

- [Ubuntu 14.04](http://gnometerminator.blogspot.fr/p/introduction.html) environment
- [ROS Indigo](http://wiki.ros.org/indigo)
- the [CAFER framework release](https://github.com/robotsthatdream/cafer)
- [g++6](https://gcc.gnu.org/gcc-6/)
- [clang 3.8](http://llvm.org/releases/3.8.0/tools/clang/docs/ReleaseNotes.html)
- [QtCreator 4.1](https://blog.qt.io/blog/2016/08/25/qt-creator-4-1-0-released/)
- the [**catkin_tools**](https://catkin-tools.readthedocs.io/en/latest/) package as a modern replacement for the [catkin_make](http://wiki.ros.org/catkin/commands/catkin_make) command. It eases a lot the development flow with QtCreator.
- [terminator](http://gnometerminator.blogspot.fr/p/introduction.html) as the terminal emulator with:
    - the [Z shell](http://zsh.sourceforge.net/)
    - [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
    - [zsh syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
    - the [powerlevel9k theme](https://github.com/bhilburn/powerlevel9k)

## Cafer_docker images' structure

![Docker compose view](http://gdurl.com/hMNV)

## How-to
### Launch demo development environment

To launch the development environment, you need:
- To create the folder structure /home/$USER/DockerData/catkin_ws/src 
  If you want another folder to sync data between your dev environment and the host, edit the corresponding line in the docker-compose.yml file:

    ```YAML
    ide_data:
      build: ./IDE_data
      image: ide_data:v1
      volumes:
        - /THE_HOST_PATH_YOU_WANT:/home/docker_user/catkin_ws/src
        - /home/docker_user/catkin_ws
      command: chown -R 1000:1000 /home/docker_user/catkin_ws
    ```
    
- To run the environment, just do (from the project root):

    ```Shell
    sudo docker-compose up
    ```

Then you will watch the Docker images being built and launched as containers.

### Access to host' devices
If you want to have access to an host device like cameras, just edit the [docker-compose.yml](https://github.com/robotsthatdream/cafer_docker/blob/master/docker-compose.yml) [following this guide](https://docs.docker.com/compose/compose-file/#devices).

## TODO

- Enable video hardware acceleration on container (by sharing the GPU as a device, as described [HERE](http://wiki.ros.org/docker/Tutorials/Hardware%20Acceleration)).


