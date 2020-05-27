.PHONY: all deps build run clean

all: build

deps: charliecloud-0.15/bin/ch-build

charliecloud-0.15/bin/ch-build: charliecloud-0.15
	cd charliecloud-0.15 && ./configure && make

charliecloud-0.15: charliecloud-0.15.tar.gz
	tar -xf charliecloud-0.15.tar.gz

charliecloud-0.15.tar.gz:
	wget https://github.com/hpc/charliecloud/releases/download/v0.15/charliecloud-0.15.tar.gz

build: tvarit.jupyterhub.tar.gz

docker: context
	docker build -t tvarit/jupyterhub context

tvarit.jupyterhub.tar.gz: clean context
	charliecloud-0.15/bin/ch-build -t tvarit/jupyterhub context
	charliecloud-0.15/bin/ch-builder2tar tvarit/jupyterhub .

run: tvarit.jupyterhub
	charliecloud-0.15/bin/ch-run -g 0 -u 0 -w --no-home --no-passwd --private-tmp ./tvarit.jupyterhub -- /bin/bash

tvarit.jupyterhub:
	charliecloud-0.15/bin/ch-tar2dir tvarit.jupyterhub.tar.gz .

clean:
	@rm -rf tvarit.jupyterhub
	@rm -rf tvarit.jupyterhub.tar.gz
