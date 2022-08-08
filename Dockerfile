FROM ubuntu:20.04 AS ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update &&\
    apt-get -y install build-essential cmake vim-nox python3-dev &&\
    apt-get -y install mono-complete golang nodejs default-jdk npm git &&\
    git clone https://github.com/ycm-core/YouCompleteMe.git &&\
    cd YouCompleteMe &&\
    git submodule update --init --recursive &&\
    python3 install.py --all

FROM scratch

COPY --from=ubuntu /YouCompleteMe .
