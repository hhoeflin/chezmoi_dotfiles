# Dotfiles Improvement Issues

Issues are categorized by area and tracked with a letter prefix and number.

| ID | Area | Description | Status |
|----|------|-------------|--------|
| S1 | Security | Switch git credential helper from plaintext store | wontfix |
| B1 | Bug | Kitty Nightfly theme file is unused (no include in kitty.conf) | notabug |
| B2 | Bug | `autoload -Uz resize` in .zshrc silently fails; `^[OH`/`^[OF` Home/End bindings missing in bash/zsh | fixed |
| B3 | Bug | `pythonrc.py` prints `__file__` on every Python startup (debug leftover) | fixed |
| B4 | Bug | Potential double conda/micromamba init in login+interactive sessions | open |
| C1 | Chezmoi | Add `.chezmoi.toml.tmpl` for machine-specific config via templates | open |
| C2 | Chezmoi | Add `.chezmoiignore` to prevent accidental file syncing | done |
| C3 | Chezmoi | Pin joshuto in `.chezmoiexternal.toml` to a specific tag/commit | open |
| C4 | Chezmoi | Add `run_once_` install scripts for bootstrapping tools | open |
| C5 | Chezmoi | Populate or document the empty `profile.d/` drop-in directory | open |
| SH1 | Shell | Give zsh a proper config instead of sourcing `.bashrc` | fixed |
| SH2 | Shell | Consolidate duplicated history settings across `.zshrc` and `.bashrc` | fixed |
| SH3 | Shell | Extract shared aliases into `~/.shell_interactive` (`.bashrc_prog` still has subset) | partial |
| N1 | Neovim | Remove one of `aerial.nvim` / `outline.nvim` (redundant symbol outlines) | open |
| N2 | Neovim | Evaluate removing `lspsaga` given overlap with `trouble.nvim` and native LSP | open |
| N3 | Neovim | Unpin or update `telescope.nvim` from old tag `0.1.5` | open |
| M1 | Polish | Align tmux color theme with Nightfly (currently Dracula-derived) | open |
| M2 | Polish | Keep `cheatsheet.md` in sync with actual keymaps or auto-generate it | open |

---

## Detail

### S1 — Switch git credential helper from plaintext store [wontfix]
**File**: `private_dot_config/git/config`  
`credential.helper = store` writes credentials to `~/.git-credentials` in plaintext.
No good alternative in multi-machine / headless environments where secret service daemons
are unavailable. Keeping `store` with documented tradeoff.

### B1 — Kitty Nightfly theme file is unused [notabug]
**Files**: `private_dot_config/kitty/kitty.conf`, `private_dot_config/kitty/nightfly-theme.conf`  
The theme file is included via `include nightfly-theme.conf` at line 1513 of kitty.conf.
This was a false alarm — the include is present, just buried in a large config file.

### B2 — `autoload -Uz resize` in .zshrc; Home/End keys in Kitty on macOS [fixed]
**File**: `dot_zshrc`, `private_dot_bashrc`  
`resize` is not a standard zsh autoloadable function (removed). Additionally, Home/End keys
in Kitty on macOS send `^[OH`/`^[OF` in application cursor key mode, but only `^[[H`/`^[[F`
were bound. Added all common Home/End escape sequences to both `.zshrc` (bindkey) and
`.bashrc` (bind), covering Kitty, Mac Terminal.app, iTerm2, and rxvt.

### B3 — `pythonrc.py` prints `__file__` on every Python startup [fixed]
**File**: `private_dot_config/python/pythonrc.py` (deleted)  
The entire `private_dot_config/python/` directory was removed along with `ipython_fzf_history.py`.
The `PYTHONSTARTUP` export was removed from `.bashrc`. Run `rm ~/.config/python/pythonrc.py`
on target machines to clean up.

### B4 — Potential double conda/micromamba init
**Files**: `private_dot_bashrc`, `private_dot_config/conda/init.sh`  
`micromamba shell hook` runs in `.bashrc` and `conda/init.sh` is sourced via `profile.d/`
in `.profile`. In a login+interactive session both run, potentially double-initializing
the conda environment and prepending to PATH twice.

### C1 — Add `.chezmoi.toml.tmpl` for machine-specific config
Currently Homebrew prefix detection is done at shell runtime. A chezmoi template could
compute a variable like `{{ .homebrew_prefix }}` once at apply-time and bake it into
generated files, making configs faster and more explicit.

### C2 — Add `.chezmoiignore`
**Done**: see `.chezmoiignore`.

### C3 — Pin joshuto to a specific release
**File**: `.chezmoiexternal.toml`  
`joshuto` is fetched from `main` HEAD, making it non-reproducible across machines.
Find the latest release tag and pin to it like `tpm` is pinned to `v3.1.0`.

### C4 — Add `run_once_` install scripts
There are no automated install scripts for any of the tools referenced in the shell config
(starship, atuin, zoxide, lsd, bat, fzf, delta, lazygit, etc.). Adding idempotent
`run_once_install-*.sh` scripts would make bootstrapping a new machine fully automated.

### C5 — Populate or document `profile.d/`
`profile.d/` is managed by chezmoi (via a `.keep` file) but nothing is sourced into it
through chezmoi. Either add scripts there or document what is expected to be placed there
manually (e.g., machine-local secrets, work-specific env vars).

### SH1 — Give zsh a proper config [fixed]
**Files**: `dot_zshrc`, `dot_shell_common`, `dot_shell_interactive`  
`.zshrc` no longer sources `.bashrc`. It now has its own config that sources `~/.shell_common`
(shared env vars, Homebrew detection, Lmod) and `~/.shell_interactive` (aliases, tools,
dotenv, stty), then applies zsh-specific settings (`setopt`, `bindkey`). This makes it
straightforward to add zsh completions, plugins, etc. in the future.

### SH2 — Consolidate history settings [fixed]
**Files**: `dot_zshrc`, `private_dot_bashrc`  
History settings are now in their respective shell configs only — no more overlap from
`.zshrc` sourcing `.bashrc`. `.zshrc` sets `HISTSIZE` and zsh `setopt` options; `.bashrc`
sets `HISTFILESIZE`, `HISTSIZE`, and bash `shopt` options.

### SH3 — Extract shared aliases into `~/.shell_interactive` [partial]
**Files**: `dot_shell_interactive`, `private_dot_bashrc_prog`  
`.bashrc` and `.zshrc` now share aliases via `~/.shell_interactive`. `.bashrc_prog` still
maintains its own minimal alias subset (`dtask`, `e`) since it can't source
`~/.shell_interactive` (its tools are initialized from `~/.local/progs/` instead of
Homebrew). Full dedup would require extracting aliases into a separate file, but the
current duplication is limited to 2 aliases.

### N1 — Remove redundant symbol outline plugin
**File**: `private_dot_config/nvim/`  
Both `aerial.nvim` (`<leader>a`) and `outline.nvim` (`<leader>o`, `<leader>t`) provide
symbol outlines. Pick one and remove the other to reduce startup time and config surface.

### N2 — Evaluate removing lspsaga
**File**: `private_dot_config/nvim/`  
With Neovim 0.11's improved native LSP UI and `trouble.nvim` handling diagnostics,
`lspsaga.nvim` may no longer justify its weight. Audit which keymaps actually use it
and migrate or drop them.

### N3 — Update telescope.nvim
**File**: `private_dot_config/nvim/lazy-lock.json`  
`telescope.nvim` is pinned to tag `0.1.5` (2023) while all other plugins track HEAD.
Update to a recent commit and resolve any API changes.

### M1 — Align tmux theme with Nightfly
**File**: `private_dot_config/tmux/tmuxline.conf`  
Neovim and Kitty use the Nightfly theme; tmux uses a Dracula-derived palette from
`tmuxline.conf`. Regenerating `tmuxline.conf` from within Neovim's tmuxline plugin
(or manually writing a Nightfly-based version) would unify the look.

### M2 — Keep cheatsheet.md in sync
**File**: `private_dot_config/nvim/cheatsheet.md`  
The cheatsheet is manually maintained alongside the Neovim config. When keymaps change,
the cheatsheet can drift. Consider adding a comment header noting it requires manual
updates, or explore auto-generation via a script.
