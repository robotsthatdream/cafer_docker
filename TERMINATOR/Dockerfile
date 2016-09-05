FROM dev_tools:v1
MAINTAINER Pierre-Henri Le Fur <lefur@edu.ece.fr>

#Install Terminator and dependencies (including gtk2 and python 2.7)
RUN add-apt-repository ppa:gnome-terminator && \
    apt-get update && \
    apt-get install -y terminator zsh fontconfig

#Set Z shell as default shell
RUN chsh docker_user -s /bin/zsh

#Create UTF-8 locale which was removed from ubuntu docker image and is needed by the Powerlevel9k theme.
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

USER docker_user

#Install oh-my-zsh
RUN sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" && \
    sed -i '1s/^/export TERM="xterm-256color" /' .zshrc


#Install the powerlevel9k theme
RUN git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k && \
    sed -i '/ZSH_THEME="robbyrussell"/c\ZSH_THEME="powerlevel9k/powerlevel9k"' .zshrc

#Install the zsh syntax highlighting plugin
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
    sed -i '/plugins=(git)/c\plugins=(git zsh-syntax-highlighting)' .zshrc

#Install special terminal fonts
RUN wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf && \
    wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf && \
    mkdir ~/.fonts/ && \
    mkdir -p ~/.config/fontconfig/conf.d/ && \	
    mv PowerlineSymbols.otf ~/.fonts/ && \
    fc-cache -vf ~/.fonts/ && \
    mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

#Source ROS related files and CAFER package at launch
RUN printf "\nsource /opt/ros/indigo/setup.zsh" >> .zshrc && \
    printf "\nsource /home/docker_user/ros_packages/cafer_core/setup.zsh" >> .zshrc

#Launching the container will launch Terminator
CMD terminator
