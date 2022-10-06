.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/buildg
VERSION=0.4.1

.PHONY: all

all: ${APP_PREFIX}/bin/buildg

buildg-full-v${VERSION}-linux-amd64.tar.gz:
	wget https://github.com/ktock/buildg/releases/download/v${VERSION}/buildg-full-v${VERSION}-linux-amd64.tar.gz


${APP_PREFIX}/bin/buildg: buildg-full-v${VERSION}-linux-amd64.tar.gz
	set -e
	mkdir -p ${APP_PREFIX}
	tar xvf buildg-full-v${VERSION}-linux-amd64.tar.gz --directory=${APP_PREFIX}
	touch ${APP_PREFIX}/bin/buildg

.PHONY: clean
clean:
	rm -f buildg-full-v${VERSION}-linux-amd64.tar.gz

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
