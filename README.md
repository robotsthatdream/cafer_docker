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
- **Vagrant** (uses LXC like docker):
  - Takes a lot of space
  - The development environment is not modulable: changing a library version in the VM involves either building a new VM or deal with differents libs as on the baremetal machine.

### **Docker** (not VMs but containers, thanks to LXC)
- Use AUFS to share similarities between different images and save a lot of diskspace
- It is possible to build a specific library / application version in a container, expose its files to others containers so they can use it.
- The last point make it the dev environment modular: want another version of the same lib? Change the corresponding container.

## Requirements:

- Linux OS with kernel >=3.10
- [Docker-Engine >=1.10](https://docs.docker.com/engine/installation/)
- [Docker-Compose >=1.6](https://docs.docker.com/compose/install/)

## Cafer_docker images' structure

![Docker compose view](http://gdurl.com/xuz4)

## How-to
### Launch demo development environment

To launch the development environment, you need:
- To create the folder structure /home/$USER/DockerData/catkin_ws/src 
  If you want another folder to sync data between your dev environment and the host, edit the corresponding line in the docker-compose.yml file:

> ide_data:

>      build: ./IDE_data
>      image: ide_data:v1
>      volumes:
>        - /THE_HOST_PATH_YOU_WANT:/home/docker_user/catkin_ws/src
>        - /home/docker_user/catkin_ws
>      command: chown -R 1000:1000 /home/docker_user/catkin_ws

- To run the environment, just do (from the project root):

> sudo docker-compose up

Then you must watch the Docker images being built and then launched in containers.

### Customize the development environment to your liking

- The tools bundled with the Docker image are here for demonstration purpose.
- For instance not everyone would need CLion as a C++ IDE.

To replace it with a graphical IDE (provided that you need one), just edit the file [IDE/DockerFile](https://github.com/robotsthatdream/cafer_docker/blob/master/IDE/Dockerfile):

```
FROM ros_indigo:v1
MAINTAINER Pierre-Henri Le Fur <lefur@edu.ece.fr>

#Lib dependencies for CLion UI                                            > Most IDE with a GUI will need these dependencies
RUN apt-get install -y libgtk2.0-0 libxtst6 

USER docker_user                                                          > Never use sudo: use USER root to switch to superuser

#Copy and extract IDE archive's file from context to the container        > Replace these lines by:
RUN wget -qO- https://download.jetbrains.com/cpp/CLion-2016.1.3.tar.gz \  > RUN + "The set of commands to get and install the IDE"
 | tar --transform 's/^dbt2-0.37.50.3/dbt2/' -xvz                         > e.g.: RUN add-apt-repository ppa:webupd8team/sublime-text-2 
                                                                          > \&& apt-get update && apt-get install sublime-text
#Launching the container will launch CLion
CMD cd /home/docker_user/clion-2016.1.3/bin && ./clion.sh                 > Replace it by CMD + "the command to launch the IDE"
                                                                          > e.g.: CMD sublime-text 
                                                                          > (don't launch as root: use USER docker_user before, if necessary)
```
### OSX and Windows users

Docker run under Windows and OSX thanks to [Docker-Machine](https://docs.docker.com/machine/overview/).
[Docker-Machine](https://docs.docker.com/machine/overview/) is mostly a lightweight Linux Virtual Machine (consumes ~25Mo of RAM, boot in 5 seconds) so it is still more interesting to use than a classic VM. 

But for applications that use a GUI, it is not possible to share the X11 Unix socket from the host as there is no such thing on OSX / Windows hosts,
 one must use [XQuartz](https://xquartz.macosforge.org/trac) (OSX) /[XMing](http://www.straightrunning.com/XmingNotes/) (Windows)
 
See: [GNU Octave via Docker](http://blog.ctaggart.com/2016/03/gnu-octave-via-docker-x11.html).

## TODO

- Enable video hardware acceleration on container (by sharing the GPU as a device, as described [HERE](http://wiki.ros.org/docker/Tutorials/Hardware%20Acceleration).
- Detailed explanations for using Docker with OSX / Windows.
- Instructions on how-to use CAFER in C++ / Python projects as CAFER files exist in /usr/local/cafer on the container.


