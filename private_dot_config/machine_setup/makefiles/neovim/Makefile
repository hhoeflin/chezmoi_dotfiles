.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/nvim
VERSION=0.8.0

.PHONY: all

all: ${APP_PREFIX}/bin/nvim

v${VERSION}.tar.gz:
	wget https://github.com/neovim/neovim/archive/refs/tags/v${VERSION}.tar.gz


.PHONY: deps
deps:
	$(MAKE) -C ../cmake

${APP_PREFIX}/bin/nvim: v${VERSION}.tar.gz | deps
	tar zxvf v${VERSION}.tar.gz
	cd neovim-${VERSION}
	make CMAKE_BUILD_TYPE=Release
	make CMAKE_INSTALL_PREFIX=${APP_PREFIX} install

.PHONY: clean
clean:
	rm -rf neovim-${VERSION}
	rm -f v${VERSION}.tar.gz

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
