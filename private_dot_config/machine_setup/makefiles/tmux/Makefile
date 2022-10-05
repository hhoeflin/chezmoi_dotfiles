.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/tmux
VERSION=3.3a

.PHONY: all

all: ${APP_PREFIX}/bin/tmux

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
		LDFLAGS="-L${PREFIX}/libevent/lib"
	make -j && make install

.PHONY: clean
clean:
	rm -rf tmux-${VERSION}
	rm -f tmux-${VERSION}.tar.gz
