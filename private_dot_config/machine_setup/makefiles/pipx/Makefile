.ONESHELL:


ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/pipx
PYTHON_VERSION=3.10

.PHONY: all
all: ${APP_PREFIX}/conda_env/bin/pipx

deps:
	$(MAKE) -C ../mambaforge

${APP_PREFIX}/conda_env/bin/pipx: | deps
	set -e
	. ${PREFIX}/mambaforge/shell/init_bash.sh
	mamba create -y --prefix ${APP_PREFIX}/conda_env python=${PYTHON_VERSION}
	mamba activate ${APP_PREFIX}/conda_env
	pip install pipx
	mamba deactivate
	mkdir -p ${APP_PREFIX}/bin


.PHONY: clean
clean:

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
