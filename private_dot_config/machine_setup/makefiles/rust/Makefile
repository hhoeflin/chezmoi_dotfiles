.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/cargo

.PHONY: all
all: ${APP_PREFIX}/bin/cargo

rustup.sh:
	wget --output-document rustup.sh https://sh.rustup.rs


${APP_PREFIX}/bin/cargo: rustup.sh
	chmod 770 rustup.sh
	RUSTUP_HOME=${APP_PREFIX} CARGO_HOME=${APP_PREFIX}  ./rustup.sh --no-modify-path -y

.PHONY: clean
clean:
	rm -f rushup.sh

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
