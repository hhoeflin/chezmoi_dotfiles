.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/zotero
VERSION=6.0.13

.PHONY: all

all: ${APP_PREFIX}/bin/zotero

zotero-${VERSION}.tar:
	wget --output-document zotero-${VERSION}.tar "https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64&version=${VERSION}"


${APP_PREFIX}/bin/zotero: zotero-${VERSION}.tar
	set -e
	tar xvf zotero-${VERSION}.tar
	mv Zotero_linux-x86_64 ${APP_PREFIX}
	mkdir -p ${APP_PREFIX}/bin
	ln -sf ${APP_PREFIX}/zotero ${APP_PREFIX}/bin/zotero
	touch ${APP_PREFIX}/bin/zotero

.PHONY: clean
clean:
	rm -f zotero-${VERSION}.tar

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
