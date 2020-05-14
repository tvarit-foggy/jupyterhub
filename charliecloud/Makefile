.PHONY: all deps build run

all: build

deps: charliecloud-0.15/bin/ch-build

charliecloud-0.15/bin/ch-build: charliecloud-0.15
	cd charliecloud-0.15 && ./configure && make

charliecloud-0.15: charliecloud-0.15.tar.gz
	tar -xf charliecloud-0.15.tar.gz

charliecloud-0.15.tar.gz:
	wget https://github.com/hpc/charliecloud/releases/download/v0.15/charliecloud-0.15.tar.gz

build: docker

docker: context
	docker build -t tvarit/jupyterhub context

tvarit.jupyterhub.tar.gz: context
	@rm -rf tvarit.jupyterhub
	@rm -rf tvarit.jupyterhub.tar.gz
	charliecloud-0.15/bin/ch-build -t tvarit/jupyterhub context
	charliecloud-0.15/bin/ch-builder2tar tvarit/jupyterhub .

run: tvarit.jupyterhub
	ch-run -g 0 -u 0 -w --no-home --no-passwd --private-tmp ./tvarit.jupyterhub -- /bin/bash

tvarit.jupyterhub:
	charliecloud-0.15/bin/ch-tar2dir tvarit.jupyterhub.tar.gz .
