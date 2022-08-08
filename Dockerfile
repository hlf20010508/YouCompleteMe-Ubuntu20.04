FROM ubuntu:20.04 AS ubuntu

RUN apt-get update &&\
    apt-get -y install build-essential cmake vim-nox python3-dev &&\
    apt-get -y install mono-complete golang nodejs default-jdk npm &&\
    git clone https://github.com/ycm-core/YouCompleteMe.git &&\
    cd YouCompleteMe &&\
    python3 install.py --all

FROM scratch

COPY --from=ubuntu /YouCompleteMe .
