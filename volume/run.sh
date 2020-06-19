#!/usr/bin/env bash

set -e

cd /opt/jupyterhub

. .bashrc

if [ ! -d .pyenv ]; then
  curl -k https://pyenv.run | bash
  . .bashrc
  pyenv install 3.6.6
  pyenv global 3.6.6
fi

pip3 install pip==20.1.1 setuptools==41.0.0
pip3 install Cython==0.29.17
pip3 install -r requirements.txt

cd /opt/softwares/jupyterhub/nativeauthenticator
pip install .

cd /opt/softwares/jupyterhub/nativespawner
pip install .

cd /opt/jupyterhub

jupyterhub -f /opt/softwares/jupyterhub/jupyterhub_config.py
