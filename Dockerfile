FROM python:3.7.13-alpine3.16

RUN apk update &&\
    apk add --no-cache cmake python3.7-dev git &&\
    git clone https://github.com/ycm-core/YouCompleteMe.git &&\
    cd YouCompleteMe &&\
    python3 install.py --all
