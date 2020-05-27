FROM ubuntu:16.04

USER root

RUN apt-get update && \
    apt-get install -y \
    git curl npm htop screen curl \
    openjdk-8-jdk openjdk-8-jre \
    libmysqlclient-dev \
    python3 python3-dev python3-pip

RUN npm install -g n
RUN n 12.16.1
RUN npm install -g configurable-http-proxy yarn forever bower

RUN cd /opt && \
    wget "https://dl.google.com/go/go1.12.6.linux-amd64.tar.gz" && \
    tar -xf go1.12.6.linux-amd64.tar.gz && \
    rm -rf go1.12.6.linux-amd64.tar.gz && \
    mkdir -p .go && \
    chmod 777 .go

COPY environment /etc/environment
COPY requirements.txt /opt/requirements.txt

RUN pip3 install -r /opt/requirements.txt
