#!/usr/bin/env bash

set -e

cd /opt/jupyterhub

. .bashrc

/opt/softwares/influxdb/bin/influxd run -config /opt/softwares/influxdb/influxdb.conf
