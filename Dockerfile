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
ENV PATH /usr/local/nvm/versions/node/v6.3.1/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash && \
    source  $NVM_DIR/nvm.sh && \
    nvm install $NODE_VERSION && \
    nvm alias default $NODE_VERSION && \
    nvm use default && \
    nvm install stable && \
    npm install -g storjshare-cli && \
    npm update -g storjshare-cli

EXPOSE 4000
EXPOSE 4001
EXPOSE 4002
EXPOSE 4003