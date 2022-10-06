.ONESHELL:


ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/mambaforge
VERSION=4.14.0-0

.PHONY: all
all: ${APP_PREFIX}/bin/mamba ${APP_PREFIX}/shell/init_bash.sh

Mambaforge-${VERSION}-Linux-x86_64.sh:
	wget https://github.com/conda-forge/miniforge/releases/download/${VERSION}/Mambaforge-${VERSION}-Linux-x86_64.sh


${APP_PREFIX}/bin/mamba: Mambaforge-${VERSION}-Linux-x86_64.sh
	chmod 770 Mambaforge-${VERSION}-Linux-x86_64.sh
	./Mambaforge-${VERSION}-Linux-x86_64.sh -bf -p ${APP_PREFIX}

${APP_PREFIX}/shell/init_bash.sh: mambaforge-init-template.sh
	MAMBA_PATH=${APP_PREFIX} envsubst '$$MAMBA_PATH' < mambaforge-init-template.sh > ${APP_PREFIX}/shell/init_bash.sh

.PHONY: clean
clean:
	rm -f Mambaforge-${VERSION}-Linux-x86_64.sh

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
