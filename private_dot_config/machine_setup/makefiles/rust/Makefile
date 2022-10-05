

.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

LOCAL_PREFIX=${PREFIX}/cargo

.PHONY: all
all: ${LOCAL_PREFIX}/bin/cargo

rustup.sh:
	wget --output-document rustup.sh https://sh.rustup.rs


${LOCAL_PREFIX}/bin/cargo: rustup.sh
	chmod 770 rustup.sh
	RUSTUP_HOME=${LOCAL_PREFIX} CARGO_HOME=${LOCAL_PREFIX}  ./rustup.sh --no-modify-path -y

.PHONY: clean
clean:
	rm -f rushup.sh

.PHONY: uninstall
uninstall:
	rm -rf ${LOCAL_PREFIX}
