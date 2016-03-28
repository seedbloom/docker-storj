MAINTAINER Victor Matekole <victor@GROK7.com>
FROM gliderlabs/alpine:3.3
RUN apk add --update \
    python \
    py-pip \
    python-dev \
    graphviz \
    python-dev \ 
    libgraphviz-dev \
    pkg-config gcc 
  && rm -rf /var/cache/apk/*
RUN pip install pygraphviz --install-option="--include-path=/usr/include/graphviz" --install-option="--library-path=/usr/lib/graphviz/" && \
    pip install dataserv-client
ENTRYPOINT ["dataserv-client"]