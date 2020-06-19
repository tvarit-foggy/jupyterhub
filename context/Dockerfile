FROM ubuntu:16.04

USER root
WORKDIR /opt

RUN apt-get update && \
apt-get install -y \
git curl npm htop screen curl wget nano openjdk-8-jdk openjdk-8-jre mysql \
build-essential libsqlite3-dev libbz2-dev zlib1g-dev libmysqlclient-dev \
libreadline-dev gettext libffi-dev ssed apt-transport-https libssl-dev \
ca-certificates libpng12-0 libqhull7 pkg-config zip unzip p7zip-full \
liblzma-dev checkinstall cmake yasm gfortran libboost-all-dev ffmpeg \
libgphoto2-dev libeigen3-dev libhdf5-dev doxygen libjpeg-dev libpng12-dev \
libtiff5-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev \
libtbb-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev \
libopencore-amrwb-dev libtheora-dev libvorbis-dev \
x264 libprotobuf-dev protobuf-compiler liblapacke-dev libopenblas-dev \
libgdal-dev libatlas-base-dev libgoogle-glog-dev libgflags-dev \
texlive-full texlive-xetex texlive-science texlive-publishers texlive-music \
texlive-htmlxml texlive-extra-utils texlive-bibtex-extra texlive-fonts-extra \
texlive-formats-extra texlive-generic-extra texlive-latex-extra \
texlive-math-extra texlive-plain-extra && \
apt-get clean autoclean && \
apt-get autoremove --yes && \
rm -rf /var/lib/{apt,dpkg,cache,log}

RUN npm install -g n
RUN n 12.16.1
RUN npm install -g configurable-http-proxy yarn forever

RUN addgroup --system -gid 1000 jupyterhub && \
adduser --system --home /opt/jupyterhub --uid 1000 --gid 1000 jupyterhub

USER jupyterhub

EXPOSE 8000
VOLUME /opt/jupyterhub
WORKDIR /opt/jupyterhub

ENTRYPOINT [ "/opt/jupyterhub/run.sh" ]
