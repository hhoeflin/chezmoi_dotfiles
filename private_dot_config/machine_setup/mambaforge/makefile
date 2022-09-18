.PHONY: all

MODULES_DIR=${HOME}/.config/modules
all: ${HOME}/mambaforge/condabin/conda

clean:
	rm Mambaforge-Linux-x86_64.sh

Mambaforge-Linux-x86_64.sh:
	wget https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh && chmod +x Mambaforge-Linux-x86_64.sh

${HOME}/mambaforge/condabin/conda: Mambaforge-Linux-x86_64.sh
	./Mambaforge-Linux-x86_64.sh -bf
