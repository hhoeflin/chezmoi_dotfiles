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

.PHONY: clean
clean:
	$(MAKE) -C libevent clean
	$(MAKE) -C ncurses clean
	$(MAKE) -C tmux clean
	$(MAKE) -C mambaforge clean
	$(MAKE) -C golang clean
	$(MAKE) -C rust clean
	$(MAKE) -C cmake clean

.PHONY: uninstall
uninstall:
	$(MAKE) -C libevent uninstall
	$(MAKE) -C ncurses uninstall
	$(MAKE) -C tmux uninstall
	$(MAKE) -C mambaforge uninstall
	$(MAKE) -C golang uninstall
	$(MAKE) -C rust uninstall
	$(MAKE) -C cmake uninstall


#brew "bat"
#brew "broot"
#brew "exa"
#brew "fd"
#brew "fzf"
#brew "git"
#brew "glow"
#brew "htop"
#brew "lazygit"
#brew "neovim"
#brew "ripgrep"
#brew "tldr"
#brew "icdiff"
#brew "zoxide"
#brew "dust"
#brew "duf"
#brew "mcfly"

#brew "python"
#brew "mypy"
#brew "isort"
#brew "black"
#brew "pyright"


#tap "go-task/homebrew-tap"
#brew "go-task"

#tap "hhoeflin/tap"
#brew "zotero"
#brew "buildg"
