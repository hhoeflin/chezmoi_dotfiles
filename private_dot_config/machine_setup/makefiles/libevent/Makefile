.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

VERSION=2.1.12

all: ${PREFIX}/lib/libevent.a

libevent-${VERSION}-stable.tar.gz:
	wget https://github.com/libevent/libevent/releases/download/release-${VERSION}-stable/libevent-${VERSION}-stable.tar.gz


${PREFIX}/lib/libevent.a: libevent-${VERSION}-stable.tar.gz
	tar zxvf libevent-${VERSION}-stable.tar.gz
	cd libevent-${VERSION}-stable
	mkdir -p ${PREFIX}
	# install libevent under $HOME/local
	./configure --prefix=${PREFIX}
	make -j && make install




.PHONY: clean
clean:
	rm -rf libevent-${VERSION}-stable
	rm -f libevent-${VERSION}-stable.tar.gz
