.ONESHELL:

PREFIX=${HOME}/.local
export PREFIX

all:
	make -C libevent all
	make -C ncurses all
	make -C tmux all
	make -C mambaforge all


clean:
	make -C libevent clean
	make -C ncurses clean
	make -C tmux clean
	make -C mambaforge clean
