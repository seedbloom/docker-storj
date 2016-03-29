FROM python:2.7.11-alpine
MAINTAINER Victor Matekole <victor@GROK7.com>
RUN apk add --update \    
    graphviz-dev \
    musl-dev \
    build-base \
    linux-headers \
    pkgconfig \
    gcc && \
    rm -rf /var/cache/apk/*
RUN pip install pygraphviz && \
    pip install dataserv-client
ENTRYPOINT ["dataserv-client"]