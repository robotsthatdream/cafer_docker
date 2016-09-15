# cafer_docker
Cafer ready development environment bundled as docker images. This branch hosts the Windows version of the project.

More detailed explanations can be found on the master branch.

## Differences with the Linux version

- Docker uses the Linux kernel features to make isolated containers. Therefore the Microsoft Windows and Apple macOS versions of Docker run in a very lightweight Linux virtual machine using the OSes' hypervisors. If this is nearly transparent for the user, this solution is slower compared to Docker running on a genuine Linux host and make accessing the host hardware devices, like cameras, tricky.
- On Linux OSes, the Docker containers can access to the host's X Server display socket at /tmp/.X11-unix/X0 provided they have the right permissions. As Windows and macOS don't have a X display server, one must be installed and listen for TCP connections as this is the only way for containers to connect to the X server on these systems.

## Prerequisites

- [Docker for Windows](https://docs.docker.com/docker-for-windows/)
- [A X display server like Cygwin/X](http://x.cygwin.com/docs/ug/setup-cygwin-x-installing.html)

## How to use

- Launch Docker for Windows
- Launch the X display server in multiwindow mode and make it listen for TCP connections (make sure you authorized it in your system's firewall). For instance, to run Cygwin/X from its installation root:

    ```Powershell
    bin\run.exe --quote /usr/bin/bash.exe -l -c "/usr/bin/XWin :0 -listen tcp -multiwindow -clipboard -nowgl -ac"
    ``` 
    - "listen tcp" allows containers to connect to the X Server using TCP
    - "clipboard" allows the X Server to use the system clipboard which ease Desktop integration
    - "nowgl" disables hardware OpenGL support. This is the only way to make application like RViz run at the moment.
    - "ac" disables acces control: any application relying on the X Server for display can connect to Cygwin/X through TCP
- Make sure that the DISPLAY variable's value in the [docker-compose.yml file](https://github.com/robotsthatdream/cafer_docker/blob/windows/docker-compose.yml#L45) matches your host IPv4 on the Docker network interface: ![Docker network interface status](http://gdurl.com/jfIo)
- Launch the ROS development environment with:

    ```Powershell
    docker-compose up
    ```
    from the cafer_docker folder.
    
## Sidenote for macOS users

For macOS users, the principle is the same as are the differences regarding to the Linux version. But one may use [XQuartz](https://xquartz.macosforge.org/trac) as the X display server instead of Cygwin/X.
 
See: 
- [Docker for macOS](https://docs.docker.com/engine/installation/mac/)
- [GNU Octave via Docker](http://blog.ctaggart.com/2016/03/gnu-octave-via-docker-x11.html) as an example

