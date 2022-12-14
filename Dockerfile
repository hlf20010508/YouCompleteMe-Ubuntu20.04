from ubuntu:20.04 as ubuntu

env DEBIAN_FRONTEND=noninteractive

run apt-get update &&\
    apt-get -y install software-properties-common &&\
    add-apt-repository ppa:longsleep/golang-backports &&\
    apt-get update &&\
    apt-get -y install build-essential cmake vim-nox python3-dev wget curl &&\
    apt-get -y install mono-complete golang nodejs default-jdk npm git
    
run useradd -ms /bin/bash ubuntu

user ubuntu

workdir /home/ubuntu

run git clone https://github.com/ycm-core/YouCompleteMe.git &&\
    cd YouCompleteMe &&\
    git submodule update --init --recursive &&\
    python3 install.py --all

from alpine:3.15.5

copy --from=ubuntu /home/ubuntu/YouCompleteMe /srv/YouCompleteMe

entrypoint echo "Project located in /srv/YouCompleteMe" &&\
    echo "Copy it out using command:" &&\
    echo "sudo docker cp youcompleteme:/srv/YouCompleteMe ~/.vim/YOUR_PLUGIN_LOCATION/YouCompleteMe"
