# Dotfiles Setup — Agent Reference

This document describes the dotfiles repository managed by [chezmoi](https://chezmoi.io).
It serves as a quick reference for AI agents and collaborators working in this codebase.

---

## Repository Purpose

Personal dotfiles for **Holger Hoefling** (`hhoeflin@gmail.com`), managed with chezmoi.
The setup targets two environments:

- **Primary**: macOS or Linux with [Homebrew](https://brew.sh) available
- **Fallback**: HPC/server environments without Homebrew (manual tool installs under `~/.local/progs/`)

---

## Repository Layout

```
chezmoi/
├── .chezmoiexternal.toml      # External archive fetching (tpm, joshuto)
├── .chezmoiignore             # Files excluded from chezmoi management
├── AGENTS.md                  # This file
├── ISSUES.md                  # Tracked improvement issues
├── dot_bash_profile           # → ~/.bash_profile
├── dot_profile                # → ~/.profile  (sources profile.d/*.sh)
├── dot_shell_common           # → ~/.shell_common  (shared env vars, Homebrew, Lmod)
├── dot_shell_interactive       # → ~/.shell_interactive  (aliases, tools, dotenv)
├── dot_zshrc                  # → ~/.zshrc  (zsh-specific: setopt, bindkey)
├── private_dot_bashrc         # → ~/.bashrc  (bash orchestrator)
├── private_dot_bashrc_prog    # → ~/.bashrc_prog  (Homebrew-free fallback)
├── dot_ipython/               # → ~/.ipython/
├── dot_terminfo/              # → ~/.terminfo/  (kitty terminfo)
├── profile.d/                 # → ~/profile.d/  (drop-in profile scripts, currently empty)
└── private_dot_config/        # → ~/.config/  (all tool configs, mode 0600)
    ├── atuin/                 # Shell history daemon config
    ├── conda/                 # Conda/mamba init script
    ├── git/                   # Global git config (editor=nvim, pager=delta)
    ├── glow/                  # Glow markdown renderer
    ├── go-task/nginx/         # Taskfile + nginx template for port-mapping proxy
    ├── kitty/                 # Kitty terminal emulator config + Nightfly theme
    ├── lazygit/               # LazyGit TUI config (vim keybindings)
    ├── lf/                    # lf file manager config
    ├── lsd/                   # lsd (modern ls) config
    ├── nvim/                  # Neovim config (Lua, lazy.nvim) — exact-synced
    ├── opencode/              # OpenCode AI assistant config
    ├── pistol/                # File previewer (used by lf)
    └── starship.toml          # Starship shell prompt config
```

### Chezmoi File Naming Conventions

| Prefix | Effect |
|--------|--------|
| `dot_` | Adds a leading `.` to the target filename |
| `private_` | Sets target file permissions to `0600` |
| `exact_` | Deletes untracked files from the target directory |

---

## Shell Configuration

The shell setup is split across **shared config files** and **shell-specific entry points**:

| File | Purpose |
|------|---------|
| `~/.shell_common` | Shared env vars, Homebrew detection, Lmod, module paths |
| `~/.shell_interactive` | Shared aliases, tools (atuin, zoxide, starship, micromamba), dotenv, stty |
| `~/.bashrc` | Bash orchestrator: profile guard → shell_common → Homebrew fallback → bash-preexec → shell_interactive → bash shopt/bind |
| `~/.zshrc` | Zsh entry point: profile guard → shell_common → shell_interactive → zsh setopt/bindkey |
| `~/.bashrc_prog` | Homebrew-free fallback for HPC: shell_common → own tool init from `~/.local/progs/` |

### Startup order (login + interactive bash)

1. `~/.bash_profile` — sources `~/.profile`, then `~/.bashrc`
2. `~/.profile` — sets `__PROFILE_LOADED` sentinel, sources `~/profile.d/*.sh`
3. `~/.bashrc`:
   - Sources `/etc/profile` + `~/.profile` if sentinel is unset (SSH non-login sessions)
   - Sources `~/profile.d/*.sh`
   - Exits early inside Singularity containers
   - Sources `~/.shell_common` (env vars, Homebrew detection, Lmod)
   - Falls back to `~/.bashrc_prog` if no Homebrew is found
   - For interactive shells: bash-preexec → `~/.shell_interactive` → bash-specific settings

### Startup order (interactive zsh)

1. `~/.zshrc`:
   - Profile guard (same as bash)
   - Sources `~/.shell_common`
   - Sources `~/.shell_interactive`
   - Applies zsh-specific `setopt` and `bindkey`

### Startup order (Homebrew-free fallback)

1. `~/.bashrc` detects no Homebrew → sources `~/.bashrc_prog`
2. `~/.bashrc_prog`:
   - Lmod from `~/.local/progs/`
   - Sources `~/.shell_common` (env vars, skips Homebrew)
   - For interactive shells: bash-specific settings → tool init from `~/.local/progs/`

### Shell hooks initialized (interactive only)

| Tool | Purpose |
|------|---------|
| [Atuin](https://atuin.sh) | Shell history search and sync |
| [Zoxide](https://github.com/ajeetdsouza/zoxide) | Smarter `cd` with frecency |
| [Starship](https://starship.rs) | Cross-shell prompt |
| [Micromamba](https://mamba.readthedocs.io) | Conda environment management |

### Key aliases

| Alias | Expands to |
|-------|-----------|
| `lg` | `lazygit` |
| `cm` | `chezmoi` |
| `ls/ll/lt` | `lsd` variants |
| `e` | `$EDITOR` with fzf + bat preview |
| `dtask` | `task` with default Taskfile |

---

## Neovim Configuration

**Location**: `private_dot_config/nvim/` (exact-synced, Lua-based, lazy.nvim)

### Architecture

```
nvim/
├── init.lua              # Bootstraps lazy.nvim; loads settings, config, lsp_settings
├── lua/
│   ├── settings.lua      # Core editor options and global keymaps
│   ├── lsp_settings.lua  # LSP server configs (Neovim 0.11 native API)
│   └── myutils/
│       └── cheatsheet.lua  # Opens cheatsheet.md in a glow float
├── plugin/               # Per-plugin lazy.nvim specs
├── cheatsheet.md         # Keymap reference (two views: by-plugin, by-key)
└── lazy-lock.json        # Pinned plugin commits (33 plugins)
```

### Language Support

| Language | LSP | Formatter | Linter |
|----------|-----|-----------|--------|
| Python | basedpyright | ruff (configurable via `NVIM_FORMAT_PYTHON`) | ruff + mypy (configurable via `NVIM_LINT_PYTHON`) |
| Lua | lua_ls | stylua | — |
| Rust | rustaceanvim (rust-analyzer) | rustfmt | — |
| R | — | styler | — |
| JS/TS | — | prettier | — |
| Haskell | — | ormolu | — |

### Notable Plugins

| Plugin | Role |
|--------|------|
| `blink.cmp` | Completion engine (Rust fuzzy matcher) |
| `copilot.lua` + `blink-cmp-copilot` | GitHub Copilot via completion menu |
| `telescope.nvim` | Fuzzy finder (files, grep, buffers, emoji, file-browser) |
| `nvim-tree.lua` | File explorer sidebar (`<C-p>`) |
| `vim-slime` | Send code to tmux REPL |
| `obsidian.nvim` | Obsidian vault integration (personal + work, via `OBSIDIAN_VAULT_ROOT`) |
| `diffview.nvim` | Git diff and history viewer |
| `neoformat` | Multi-language code formatting |
| `nvim-lint` | Asynchronous linting |
| `mason.nvim` | LSP/tool installer |

### Environment Variables that Affect Neovim

| Variable | Effect |
|----------|--------|
| `NVIM_FORMAT_PYTHON` | Override Python formatter list (default: `ruff`) |
| `NVIM_LINT_PYTHON` | Override Python linter list (default: `ruff,mypy`) |
| `OBSIDIAN_VAULT_ROOT` | Root directory for Obsidian vaults |

---

## Terminal Setup

| Component | Choice |
|-----------|--------|
| Terminal emulator | [Kitty](https://sw.kovidgoyal.net/kitty/) — Victor Mono Nerd Font 14pt |
| Color theme | Nightfly (`bluz71/vim-nightfly-guicolors`) — used in Neovim and Kitty |
| Multiplexer | tmux with F1 as prefix; tpm v3.1.0 for plugin management |
| Shell prompt | Starship |
| `ls` replacement | lsd |
| File manager (TUI) | lf (previewer: pistol → bat) and joshuto |
| Diff pager | delta |
| Git TUI | lazygit |
| Markdown renderer | glow |

---

## External Dependencies (`.chezmoiexternal.toml`)

| Tool | Source | Version |
|------|--------|---------|
| tpm (Tmux Plugin Manager) | GitHub release tarball | v3.1.0 (pinned) |
| joshuto | GitHub archive | `main` HEAD (unpinned — see issue C3) |

---

## Key Configuration Files Quick Reference

| File | Target | Notes |
|------|--------|-------|
| `dot_shell_common` | `~/.shell_common` | Shared env vars, Homebrew detection, Lmod |
| `dot_shell_interactive` | `~/.shell_interactive` | Shared aliases, tools, dotenv |
| `private_dot_bashrc` | `~/.bashrc` | Bash orchestrator |
| `private_dot_bashrc_prog` | `~/.bashrc_prog` | Homebrew-free fallback |
| `dot_zshrc` | `~/.zshrc` | Zsh entry point |
| `private_dot_config/git/config` | `~/.config/git/config` | editor=nvim, pager=delta |
| `private_dot_config/starship.toml` | `~/.config/starship.toml` | Hostname always shown; chezmoi indicator |
| `private_dot_config/atuin/config.toml` | `~/.config/atuin/config.toml` | `enter_accept=false`, sync v2 |
| `private_dot_config/nvim/` | `~/.config/nvim/` | Full Lua Neovim config |
| `private_dot_config/kitty/kitty.conf` | `~/.config/kitty/kitty.conf` | Victor Mono, no bell |
| `private_dot_config/tmux/tmux.conf` | `~/.config/tmux/tmux.conf` | Prefix=F1, passthrough mode |
| `.chezmoiexternal.toml` | — | External archive fetching |

---

## Known Issues

See [ISSUES.md](ISSUES.md) for the full tracked list. Summary:

- **S1**: Git credential helper stores passwords in plaintext (wontfix)
- **B1**: Kitty Nightfly theme (notabug — include is present)
- **B2**: autoload resize removed; Home/End keys fixed
- **B3**: pythonrc.py removed
- **B4**: Potential double conda/micromamba init
- **C1–C5**: Chezmoi improvements (templates, ignore, pinning, install scripts)
- **SH1–SH2**: Shell config refactored — zsh has own config, history settings consolidated
- **SH3**: Aliases shared via shell_interactive (partial — bashrc_prog still has subset)
- **N1–N3**: Neovim plugin cleanup (redundant outlines, lspsaga, telescope update)
- **M1–M2**: Polish (tmux theme alignment, cheatsheet maintenance)
