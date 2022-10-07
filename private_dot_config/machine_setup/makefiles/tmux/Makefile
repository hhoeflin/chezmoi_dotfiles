.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/tmux
VERSION=3.3a
MODULE_PATH=${PREFIX}/modules/home/tmux/default.lua

.PHONY: all

all: ${APP_PREFIX}/bin/tmux ${MODULE_PATH}

tmux-${VERSION}.tar.gz:
	wget https://github.com/tmux/tmux/releases/download/${VERSION}/tmux-${VERSION}.tar.gz


.PHONY: deps
deps:
	$(MAKE) -C ../libevent
	$(MAKE) -C ../ncurses

${APP_PREFIX}/bin/tmux: tmux-${VERSION}.tar.gz | deps
	tar zxvf tmux-${VERSION}.tar.gz
	cd tmux-${VERSION}
	# the CPPFLAGS and LDFLAGS are important, make sure you have written them correctly, or the build will fail
	./configure --prefix=${APP_PREFIX} \
		CPPFLAGS="-I${PREFIX}/libevent/include -I${PREFIX}/ncurses/include/ncurses" \
		LDFLAGS="-L${PREFIX}/libevent/lib -L${PREFIX}/ncurses/lib"
	$(MAKE) -j && $(MAKE) install

${MODULE_PATH}:
	mkdir -p $$(dirname ${MODULE_PATH})
	APP_PREFIX=${APP_PREFIX} envsubst '$$APP_PREFIX' < module_template > ${MODULE_PATH}


.PHONY: clean
clean:
	rm -rf tmux-${VERSION}
	rm -f tmux-${VERSION}.tar.gz

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
