.PHONY: all

all:
	@rm -f get-docker.sh
	curl -fsSL https://get.docker.com -o get-docker.sh
	sudo DOWNLOAD_URL="http://download.docker.com" sh get-docker.sh
	sudo usermod -aG docker ${USER}
