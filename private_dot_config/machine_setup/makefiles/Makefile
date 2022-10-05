.ONESHELL:

PREFIX=${HOME}/.local
export PREFIX

.PHONY: all
all clean uninstall:
	$(MAKE) -C libevent $@
	$(MAKE) -C ncurses $@
	$(MAKE) -C tmux $@
	$(MAKE) -C mambaforge $@
	$(MAKE) -C golang $@
	$(MAKE) -C rust $@
	$(MAKE) -C cmake $@
	$(MAKE) -C git $@
	# rust apps
	$(MAKE) -C rust_app APP=bat $@
	$(MAKE) -C rust_app APP=exa $@
	$(MAKE) -C rust_app APP=broot $@
	$(MAKE) -C rust_app APP=ripgrep APP_BINARY=rg $@
	$(MAKE) -C rust_app APP=tealdeer APP_BINARY=tldr $@
	$(MAKE) -C rust_app APP=zoxide $@
	$(MAKE) -C rust_app APP=du-dust APP_BINARY=dust $@
	$(MAKE) -C rust_app APP=fd-find APP_BINARY=fd $@
	$(MAKE) -C rust_app APP=git-delta APP_BINARY=delta $@
	$(MAKE) -C rust_app APP=bottom APP_BINARY=btm $@
	$(MAKE) -C rust_app APP=mcfly APP_BINARY=mcfly $@

.PHONY: clean
clean:
	$(MAKE) -C libevent clean
	$(MAKE) -C ncurses clean
	$(MAKE) -C tmux clean
	$(MAKE) -C mambaforge clean
	$(MAKE) -C golang clean
	$(MAKE) -C rust clean
	$(MAKE) -C cmake clean
	$(MAKE) -C git clean
	# rust apps
	$(MAKE) -C rust_app APP=bat clean
	$(MAKE) -C rust_app APP=exa clean
	$(MAKE) -C rust_app APP=broot clean
	$(MAKE) -C rust_app APP=ripgrep APP_BINARY=rg clean
	$(MAKE) -C rust_app APP=tealdeer APP_BINARY=tldr clean
	$(MAKE) -C rust_app APP=zoxide clean
	$(MAKE) -C rust_app APP=du-dust APP_BINARY=dust clean
	$(MAKE) -C rust_app APP=fd-find APP_BINARY=fd clean
	$(MAKE) -C rust_app APP=git-delta APP_BINARY=delta clean
	$(MAKE) -C rust_app APP=bottom APP_BINARY=btm clean

.PHONY: uninstall
uninstall:
	$(MAKE) -C libevent uninstall
	$(MAKE) -C ncurses uninstall
	$(MAKE) -C tmux uninstall
	$(MAKE) -C mambaforge uninstall
	$(MAKE) -C golang uninstall
	$(MAKE) -C rust uninstall
	$(MAKE) -C cmake uninstall
	$(MAKE) -C git uninstall
	# rust apps
	$(MAKE) -C rust_app APP=bat uninstall
	$(MAKE) -C rust_app APP=exa uninstall
	$(MAKE) -C rust_app APP=broot uninstall
	$(MAKE) -C rust_app APP=ripgrep APP_BINARY=rg uninstall
	$(MAKE) -C rust_app APP=tealdeer APP_BINARY=tldr uninstall
	$(MAKE) -C rust_app APP=zoxide uninstall
	$(MAKE) -C rust_app APP=dust APP_BINARY=dust uninstall
	$(MAKE) -C rust_app APP=fd-find APP_BINARY=fd uninstall
	$(MAKE) -C rust_app APP=git-delta APP_BINARY=delta uninstall
	$(MAKE) -C rust_app APP=bottom APP_BINARY=btm uninstall


#brew "fzf"
#brew "glow"  # go
#brew "htop"  # use rust bottom
#brew "lazygit"  # go
#brew "neovim"   # cmake
#brew "duf"  # go
#brew "mcfly"  # rust

#brew "python"
#brew "mypy"
#brew "isort"
#brew "black"
#brew "pyright"


#tap "go-task/homebrew-tap"
#brew "go-task"  # go

#tap "hhoeflin/tap"
#brew "zotero"
#brew "buildg"
