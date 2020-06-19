.PHONY: all

GOOS := $(shell dpkg-architecture -q DEB_HOST_ARCH_OS)
GOARCH := $(shell dpkg-architecture -q DEB_HOST_ARCH | sed s/ppc64el/ppc64le/)

all: bin/go

bin/go:
	@rm -rf ./*
	@git checkout .
	wget "https://dl.google.com/go/go1.12.6.${GOOS}-${GOARCH}.tar.gz"
	tar -xf go1.12.6.${GOOS}-${GOARCH}.tar.gz --strip-components=1
