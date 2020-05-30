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
pip3 install -r requirements.txt

if [ ! -d nativeauthenticator ]; then
  git clone -b master --single-branch https://github.com/jupyterhub/nativeauthenticator.git
  cd nativeauthenticator
  git checkout 5d346286a3985de18d298d57f11f3f2dfea0fe90
  pip install .
  cd
fi

if [ ! -d nativespawner ]; then
  git clone -b master --single-branch https://github.com/KamalGalrani/jupyterhub-nativespawner.git nativespawner
  cd nativespawner
  git checkout e6e93c70ad8f26fe000f871f9f87abda4330af02
  pip install .
  cd
fi

jupyterhub -f jupyterhub_config.py
