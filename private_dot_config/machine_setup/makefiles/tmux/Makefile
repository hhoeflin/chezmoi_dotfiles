.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

VERSION=3.3a

all: ${PREFIX}/bin/tmux

tmux-${VERSION}.tar.gz:
	wget https://github.com/tmux/tmux/releases/download/${VERSION}/tmux-${VERSION}.tar.gz


.PHONY: deps
deps:
	make -C ../libevent
	make -C ../ncurses

${PREFIX}/bin/tmux: tmux-${VERSION}.tar.gz | deps
	tar zxvf tmux-${VERSION}.tar.gz
	cd tmux-${VERSION}
	# the CPPFLAGS and LDFLAGS are important, make sure you have written them correctly, or the build will fail
	./configure --prefix=${PREFIX} \
		CPPFLAGS="-I${PREFIX}/include -I${PREFIX}/include/ncurses" \
		LDFLAGS="-L${PREFIX}/lib"
	make -j && make install




.PHONY: clean
clean:
	rm -rf tmux-${VERSION}
	rm -f tmux-${VERSION}.tar.gz
