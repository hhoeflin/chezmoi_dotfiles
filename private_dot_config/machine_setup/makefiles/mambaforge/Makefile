.ONESHELL:


ifndef PREFIX
$(error PREFIX is not set)
endif

LOCAL_PREFIX=${PREFIX}/mambaforge
VERSION=4.14.0-0

all: ${LOCAL_PREFIX}/bin/mamba

Mambaforge-${VERSION}-Linux-x86_64.sh:
	wget https://github.com/conda-forge/miniforge/releases/download/${VERSION}/Mambaforge-${VERSION}-Linux-x86_64.sh


${LOCAL_PREFIX}/bin/mamba: Mambaforge-${VERSION}-Linux-x86_64.sh
	chmod 770 Mambaforge-${VERSION}-Linux-x86_64.sh
	./Mambaforge-${VERSION}-Linux-x86_64.sh -bf -p ${LOCAL_PREFIX}


.PHONY: clean
clean:
	rm -f Mambaforge-${VERSION}-Linux-x86_64.sh
