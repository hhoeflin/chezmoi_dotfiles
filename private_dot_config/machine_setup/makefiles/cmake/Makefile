.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

VERSION=3.24.2

APP_PREFIX=${PREFIX}/cmake

.PHONY: all

all: ${APP_PREFIX}/bin/cmake

cmake-${VERSION}.tar.gz:
	wget https://github.com/Kitware/CMake/releases/download/v${VERSION}/cmake-${VERSION}.tar.gz



${APP_PREFIX}/bin/cmake: cmake-${VERSION}.tar.gz
	tar zxvf cmake-${VERSION}.tar.gz
	cd cmake-${VERSION}
	./bootstrap --prefix=${APP_PREFIX}
	make -j && make install


.PHONY: clean
clean:
	rm -rf cmake-${VERSION}
	rm -f cmake-${VERSION}.tar.gz

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
