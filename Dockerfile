FROM ubuntu:18.04

LABEL maintainer Niu Zhenyong <niuzhenyong@qq.com>

ENV GOLANG_VERSION=1.12.6 GOPATH=/root/go PATH=$GOPATH/bin:/usr/local/go/bin:$PATH

#COPY . /root/.vim/pack/vim-package

RUN ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends git vim-nox wget && \
    DEBIAN_FRONTEND=noninteractive apt-get autoclean && \
    DEBIAN_FRONTEND=noninteractive apt-get clean && \
    rm -fr /var/lib/apt/lists/* && \
    wget -O go.tgz "https://dl.google.com/go/go$GOLANG_VERSION.linux-amd64.tar.gz" && \
    tar -C /usr/local -xzf go.tgz && rm go.tgz && \
    mkdir -p "$GOPATH/src" "%GOPATH/bin" && chmod -R 777 "$GOPATH" && \
    git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go && \
    vim +':silent :GoUpdateBinaries' +':qa'

WORKDIR /root/go/src


