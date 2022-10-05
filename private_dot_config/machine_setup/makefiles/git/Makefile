.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/git
VERSION=2.38.0

.PHONY: all

all: ${APP_PREFIX}/bin/tmux

git-${VERSION}.tar.gz:
	wget https://www.kernel.org/pub/software/scm/git/git-${VERSION}.tar.gz



${APP_PREFIX}/bin/git: git-${VERSION}.tar.gz
	tar zxvf git-${VERSION}.tar.gz
	cd git-${VERSION}
	make configure
	./configure --prefix=${APP_PREFIX}
	$(MAKE) -j && $(MAKE) install

.PHONY: clean
clean:
	rm -rf git-${VERSION}
	rm -f git-${VERSION}.tar.gz

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
