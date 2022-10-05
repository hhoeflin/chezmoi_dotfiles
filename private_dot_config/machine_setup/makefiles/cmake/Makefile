.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

VERSION=3.24.2

LOCAL_PREFIX=${PREFIX}/cmake

.PHONY: all

all: ${LOCAL_PREFIX}/bin/cmake

cmake-${VERSION}.tar.gz:
	wget https://github.com/Kitware/CMake/releases/download/v${VERSION}/cmake-${VERSION}.tar.gz



${LOCAL_PREFIX}/bin/cmake: cmake-${VERSION}.tar.gz
	tar zxvf cmake-${VERSION}.tar.gz
	cd cmake-${VERSION}
	./bootstrap --prefix=${LOCAL_PREFIX}
	make -j && make install


.PHONY: clean
clean:
	rm -rf cmake-${VERSION}
	rm -f cmake-${VERSION}.tar.gz

.PHONY: uninstall
uninstall:
	rm -rf ${LOCAL_PREFIX}
