FROM ubuntu
MAINTAINER Victor Matekole <victor@GROK7.com>
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install base dependencies
RUN apt-get update && apt-get install -y -q --no-install-recommends \
        apt-transport-https \
        build-essential \
        ca-certificates \
        curl \
        git \
        libssl-dev \
        python \
        rsync \
        software-properties-common \
        wget \
    && rm -rf /var/lib/apt/lists/

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION stable

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash && \
    source  $NVM_DIR/nvm.sh && \
    nvm install $NODE_VERSION && \
    nvm alias default $NODE_VERSION && \
    nvm use default && \
    nvm install stable && \
    npm install -g storjshare-cli && \
    npm update -g storjshare-cli