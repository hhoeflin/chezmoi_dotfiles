.ONESHELL:


ifndef PREFIX
$(error PREFIX is not set)
endif

LOCAL_PREFIX=${PREFIX}/go
VERSION=1.19.2

.PHONY: all
all: ${LOCAL_PREFIX}/bin/go

go${VERSION}.linux-amd64.tar.gz:
	wget https://go.dev/dl/go${VERSION}.linux-amd64.tar.gz


${LOCAL_PREFIX}/bin/go: go${VERSION}.linux-amd64.tar.gz
	tar zxvf go${VERSION}.linux-amd64.tar.gz --directory ${PREFIX}
	touch ${LOCAL_PREFIX}/bin/go

.PHONY: clean
clean:
	rm -f go${VERSION}.linux-amd64.tar.gz

.PHONY: uninstall
uninstall:
	rm -rf ${LOCAL_PREFIX}
