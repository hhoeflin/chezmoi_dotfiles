.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

VERSION=6.3

all: ${PREFIX}/include/ncurses/ncurses.h

ncurses-${VERSION}.tar.gz:
	wget https://ftp.gnu.org/pub/gnu/ncurses/ncurses-${VERSION}.tar.gz


${PREFIX}/include/ncurses/ncurses.h: ncurses-${VERSION}.tar.gz
	tar zxvf ncurses-${VERSION}.tar.gz
	cd ncurses-${VERSION}/
	./configure --prefix=${PREFIX}
	make -j&& make install




.PHONY: clean
clean:
	rm -rf ncurses-${VERSION}
	rm -f ncurses-${VERSION}.tar.gz
