.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/pyenv

.PHONY: all
all: ${APP_PREFIX}/bin/pyenv

pyenv-installer:
	wget --output-document pyenv-installer \
		https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer


${APP_PREFIX}/bin/pyenv: pyenv-installer
	export PYENV_ROOT=${APP_PREFIX}
	chmod 770 pyenv-installer
	bash pyenv-installer

.PHONY: clean
clean:
	rm -f pyenv-installer

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
