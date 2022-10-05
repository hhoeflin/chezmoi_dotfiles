.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/go
VERSION=1.19.2

.PHONY: all
all: ${APP_PREFIX}/bin/go

go${VERSION}.linux-amd64.tar.gz:
	wget https://go.dev/dl/go${VERSION}.linux-amd64.tar.gz


${APP_PREFIX}/bin/go: go${VERSION}.linux-amd64.tar.gz
	tar zxvf go${VERSION}.linux-amd64.tar.gz --directory ${PREFIX}
	touch ${APP_PREFIX}/bin/go

.PHONY: clean
clean:
	rm -f go${VERSION}.linux-amd64.tar.gz

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
