FROM ubuntu:16.04

USER root
WORKDIR /opt

RUN apt-get update && \
apt-get install -y \
git curl npm htop screen curl wget nano \
openjdk-8-jdk openjdk-8-jre \
build-essential libsqlite3-dev \
libbz2-dev zlib1g-dev libmysqlclient-dev \
libreadline-dev gettext libffi-dev ssed \
apt-transport-https libssl-dev ca-certificates

RUN npm install -g n
RUN n 12.16.1
RUN npm install -g configurable-http-proxy yarn forever bower

RUN wget "https://dl.google.com/go/go1.12.6.linux-amd64.tar.gz" && \
tar -xf go1.12.6.linux-amd64.tar.gz && \
rm -rf go1.12.6.linux-amd64.tar.gz

RUN wget https://downloads.apache.org/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz && \
tar -xf spark-2.4.5-bin-hadoop2.7.tgz

RUN addgroup --system -gid 1000 jupyterhub && \
adduser --system --home /opt/jupyterhub --uid 1000 --gid 1000 jupyterhub

USER jupyterhub

EXPOSE 8000
VOLUME /opt/jupyterhub
WORKDIR /opt/jupyterhub

ENTRYPOINT [ "/opt/jupyterhub/run.sh" ]
