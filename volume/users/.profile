export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

export GOROOT="/opt/softwares/go"
export GOPATH="/opt/jupyterhub/.go"
export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"

export PYENV_ROOT="/opt/jupyterhub/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)" || :
eval "$(pyenv virtualenv-init -)" || :

export SPARK_HOME="/opt/softwares/spark-2.4.5-bin-hadoop2.7"
export PYTHONPATH=$SPARK_HOME/python:$PYTHONPATH
export PYSPARK_DRIVER_PYTHON="jupyter"
export PYSPARK_DRIVER_PYTHON_OPTS="notebook"
export PYSPARK_PYTHON=python3
export PATH="$SPARK_HOME/bin:$PATH"

export PATH="/opt/softwares/scripts:$PATH"

export PS1="`echo $HOME /opt/jupyterhub/users/jupyterhub | grep -Poe "(?<=/opt/jupyterhub/users/)[^/\s]*" | head -1`@tvarit:\w\$ "
