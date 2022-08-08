from ubuntu:20.04 as ubuntu

run useradd -ms /bin/bash ubuntu

user ubuntu

workdir /home/ubuntu

env DEBIAN_FRONTEND=noninteractive

run sudo apt-get update &&\
    sudo apt-get -y install build-essential cmake vim-nox python3-dev &&\
    sudo apt-get -y install mono-complete golang nodejs default-jdk npm git &&\
    git clone https://github.com/ycm-core/YouCompleteMe.git &&\
    cd YouCompleteMe &&\
    git submodule update --init --recursive &&\
    python3 install.py --all

from scratch

copy --from=ubuntu /YouCompleteMe .
