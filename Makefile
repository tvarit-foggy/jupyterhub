.PHONY: all deps docker charliecloud softwares influxdb go spark jupyterhub build run clean install uninstall start stop

all: build

# Dependencies

deps: docker charliecloud influxdb

docker: /usr/bin/docker
/usr/bin/docker:
	$(MAKE) -C deps/docker all

charliecloud: deps/charliecloud/bin
deps/charliecloud/bin:
	git checkout deps/charliecloud
	$(MAKE) -C deps/charliecloud all

# Softwares

softwares: influxdb go spark jupyterhub

influxdb: softwares/influxdb/bin/influxd
softwares/influxdb/bin/influxd:
	$(MAKE) -C softwares/influxdb all

go: softwares/go/bin/go
softwares/go/bin/go:
	$(MAKE) -C softwares/go all

spark: softwares/spark/bin/pyspark
softwares/spark/bin/pyspark:
	$(MAKE) -C softwares/spark all

jupyterhub: softwares/jupyterhub/nativespawner
softwares/jupyterhub/nativespawner:
	$(MAKE) -C softwares/jupyterhub all

# Development
build: deps softwares tvarit.jupyterhub.tar.gz

tvarit.jupyterhub.tar.gz: clean context
	deps/charliecloud/bin/ch-build -t tvarit/jupyterhub context
	deps/charliecloud/bin/ch-builder2tar tvarit/jupyterhub .

run: run-jupyterhub

run-jupyterhub: charliecloud tvarit.jupyterhub
	deps/charliecloud/bin/ch-run -g 1000 -u 1000 -w --no-home --no-passwd --private-tmp --bind=volume:/opt/jupyterhub --bind=softwares:/opt/softwares ./tvarit.jupyterhub -- /opt/jupyterhub/jupyterhub.sh

run-bash: charliecloud tvarit.jupyterhub
	deps/charliecloud/bin/ch-run -g 1000 -u 1000 -w --no-home --no-passwd --private-tmp --bind=volume:/opt/jupyterhub --bind=softwares:/opt/softwares ./tvarit.jupyterhub -- /opt/jupyterhub/bash.sh

run-influxd: charliecloud tvarit.jupyterhub
	deps/charliecloud/bin/ch-run -g 1000 -u 1000 -w --no-home --no-passwd --private-tmp --bind=volume:/opt/jupyterhub --bind=softwares:/opt/softwares ./tvarit.jupyterhub -- /opt/jupyterhub/influx.sh

tvarit.jupyterhub:
	deps/charliecloud/bin/ch-tar2dir tvarit.jupyterhub.tar.gz .

clean:
	@rm -rf tvarit.jupyterhub
	@rm -rf tvarit.jupyterhub.tar.gz

# Installation

install: tvarit.jupyterhub uninstall
	@cp -rpPf tvarit.jupyterhub tvarit.jupyterhub.deploy

uninstall: stop
	@rm -rf tvarit.jupyterhub.deploy

start: charliecloud tvarit.jupyterhub.deploy stop
	deps/charliecloud/bin/ch-run -g 1000 -u 1000 -w --no-home --no-passwd --private-tmp --bind=volume:/opt/jupyterhub --bind=softwares:/opt/softwares ./tvarit.jupyterhub.deploy -- /opt/jupyterhub/jupyterhub.sh &>jupyterhub.log & disown
	deps/charliecloud/bin/ch-run -g 1000 -u 1000 -w --no-home --no-passwd --private-tmp --bind=volume:/opt/jupyterhub --bind=softwares:/opt/softwares ./tvarit.jupyterhub.deploy -- /opt/jupyterhub/influx.sh &>influxd.log & disown

stop:
	kill `ps -ef | grep "jupyterhub -f" | grep -v grep | grep -Poe "\d+" | head -1`
	kill `ps -ef | grep "influxd run -config" | grep -v grep | grep -Poe "\d+" | head -1`
