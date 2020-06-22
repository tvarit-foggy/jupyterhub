.PHONY: all

export GOOS := $(shell dpkg-architecture -q DEB_HOST_ARCH_OS)
export GOARCH := $(shell dpkg-architecture -q DEB_HOST_ARCH | sed s/ppc64el/ppc64le/)
SRC := $(shell readlink -f src)
DIST := $(shell readlink -f dist)

all: bin/influxd

bin/influxd:
	@rm -rf bin dist src
	@mkdir bin dist src
	./releng/source-tarball/build.bash -s ff383cdc0420217e3460dabe17db54f8557d95b6 -b 1.7 -v 1.7.8 -o "${SRC}"
	./releng/raw-binaries/build.bash -i "${SRC}/influxdb-src-ff383cdc0420217e3460dabe17db54f8557d95b6.tar.gz" -o "${DIST}"
	tar -C bin -xzf dist/influxdb_bin_${GOOS}_${GOARCH}-ff383cdc0420217e3460dabe17db54f8557d95b6.tar.gz
