.PHONY: all clean

all: bin/pyspark

bin/pyspark: clean
	wget "https://downloads.apache.org/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz"
	tar -xf spark-2.4.5-bin-hadoop2.7.tgz --strip-components=1

clean:
	@rm -rf ./*
	@git checkout .
