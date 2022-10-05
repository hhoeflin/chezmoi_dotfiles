.ONESHELL:

PREFIX=${HOME}/.local
export PREFIX

.PHONY: all
all:
	$(MAKE) -C libevent all
	$(MAKE) -C ncurses all
	$(MAKE) -C tmux all
	$(MAKE) -C mambaforge all
	$(MAKE) -C golang all
	$(MAKE) -C rust all
	$(MAKE) -C cmake all
	$(MAKE) -C git all
	# rust apps
	$(MAKE) -C rust_app APP=bat all
	$(MAKE) -C rust_app APP=exa all
	$(MAKE) -C rust_app APP=broot all
	$(MAKE) -C rust_app APP=ripgrep APP_BINARY=rg all
	$(MAKE) -C rust_app APP=tealdeer APP_BINARY=tldr all
	$(MAKE) -C rust_app APP=zoxide all
	$(MAKE) -C rust_app APP=du-dust APP_BINARY=dust all
	$(MAKE) -C rust_app APP=fd-find APP_BINARY=fd all
	$(MAKE) -C rust_app APP=git-delta APP_BINARY=delta all
	$(MAKE) -C rust_app APP=bottom APP_BINARY=btm all

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
