.PHONY: all

all: charliecloud-0.15/bin

charliecloud-0.15/bin: charliecloud-0.15
	cd charliecloud-0.15 && ./configure && make

charliecloud-0.15: charliecloud-0.15.tar.gz
	tar -xf charliecloud-0.15.tar.gz

charliecloud-0.15.tar.gz:
	wget https://github.com/hpc/charliecloud/releases/download/v0.15/charliecloud-0.15.tar.gz
