.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/libevent
VERSION=2.1.12

.PHONY: all
all: ${APP_PREFIX}/lib/libevent.a

libevent-${VERSION}-stable.tar.gz:
	wget https://github.com/libevent/libevent/releases/download/release-${VERSION}-stable/libevent-${VERSION}-stable.tar.gz


${APP_PREFIX}/lib/libevent.a: libevent-${VERSION}-stable.tar.gz
	tar zxvf libevent-${VERSION}-stable.tar.gz
	cd libevent-${VERSION}-stable
	mkdir -p ${APP_PREFIX}
	# install libevent under $HOME/local
	./configure --prefix=${APP_PREFIX}
	make -j && make install




.PHONY: clean
clean:
	rm -rf libevent-${VERSION}-stable
	rm -f libevent-${VERSION}-stable.tar.gz
