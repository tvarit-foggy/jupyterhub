FROM ubuntu:16.04

USER root

RUN apt-get update && \
    apt-get install -y \
    apt-transport-https ca-certificates curl gnupg-agent software-properties-common dpkg-dev

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=$(dpkg-architecture --query DEB_HOST_ARCH)] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    apt-get update && apt-get install -y \
    docker-ce

COPY docker /etc/init.d/docker
