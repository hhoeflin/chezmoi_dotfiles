.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/ncurses
VERSION=6.3

all: ${APP_PREFIX}/include/ncurses/ncurses.h

ncurses-${VERSION}.tar.gz:
	wget https://ftp.gnu.org/pub/gnu/ncurses/ncurses-${VERSION}.tar.gz


${APP_PREFIX}/include/ncurses/ncurses.h: ncurses-${VERSION}.tar.gz
	tar zxvf ncurses-${VERSION}.tar.gz
	cd ncurses-${VERSION}/
	./configure --prefix=${APP_PREFIX}
	$(MAKE) -j && $(MAKE) install

.PHONY: clean
clean:
	rm -rf ncurses-${VERSION}
	rm -f ncurses-${VERSION}.tar.gz

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
