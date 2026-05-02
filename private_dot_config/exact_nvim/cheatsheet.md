# Neovim Keymap Cheatsheet

## View by Plugin

### aerial.nvim · nvim-tree · outline.nvim · which-key · vim-slime

| Key | Description | Key | Description |
| :--- | :--- | :--- | :--- |
| `<Leader>a` | Toggle symbol outline (aerial) | `<C-p>` | Toggle file explorer |
| `<leader>o` | Toggle outline (outline.nvim) | `<leader>t` | Focus outline |
| `<leader>?` | Show buffer-local keymaps | `<C-c><C-c>` | (Visual) Send code to REPL |

### Telescope (Fuzzy Finder)

| Key | Description | Key | Description |
| :--- | :--- | :--- | :--- |
| `<leader>ff` | Find files | `<leader>fg` | Grep text in open files |
| `<leader>fb` / `<leader>b` | Find open buffers | `<leader>fh` | Search help tags |
| `<leader>fe` | Open file browser | | |

### diffview.nvim

| Key | Description | Key | Description |
| :--- | :--- | :--- | :--- |
| `<leader>vo` | Open Diffview | `<leader>vc` | Close Diffview |
| `<leader>vr` | Refresh Diffview | `<leader>df` | Toggle file panel |
| `<leader>e` | Focus file panel | `gf` | Open file in prev tabpage |
| `<Tab>` | Next file diff | `<S-Tab>` | Previous file diff |
| `<CR>` | Open diff for selected | `-` | Stage/unstage selected |
| `S` | Stage all entries | `U` | Unstage all entries |
| `X` | Restore to left side | `R` | Refresh file list |
| `j` | Next file entry | `k` | Previous file entry |

### LSP (Language Server Protocol)

| Key | Description | Key | Description |
| :--- | :--- | :--- | :--- |
| `gd` | Go to definition | `gD` | Go to declaration |
| `gi` | Go to implementation | `<space>D` | Go to type definition |
| `<C-k>` | Show signature help | `<space>f` | Format code |
| `<leader>lre` | List LSP references | `<leader>lds` | List document symbols |
| `<leader>lws` | List workspace symbols | `<leader>lys` | List dynamic workspace symbols |
| `<leader>lca` | Code actions (normal) | `<leader>lra` | Code actions (visual/range) |
| `<leader>ldd` | Show buffer diagnostics | `<leader>lwd` | Show workspace diagnostics |
| `<leader>li` | List implementations | `<leader>lde` | List definitions |
| `<leader>ltd` | List type definitions | `<leader>lx` | Workspace diagnostics (Lspsaga) |

### General

| Key | Description | Key | Description |
| :--- | :--- | :--- | :--- |
| `\` | Leader key | `-` | Local leader key |
| `<Leader>1-9` | Switch to window 1–9 | `<leader>cs` | Toggle this cheatsheet |
| `<ESC>` | (Normal) Clear search highlight | `<ESC>` | (Terminal) Exit terminal mode |

---

## View by Key

| Key | Description | Key | Description |
| :--- | :--- | :--- | :--- |
| `<C-c><C-c>` | (Visual) Send code to REPL | `<C-k>` | Show signature help |
| `<C-p>` | Toggle file explorer | `<CR>` | (Diffview) Open diff for selected |
| `<ESC>` | Clear search highlight | `<ESC>` | Exit terminal mode |
| `<Leader>1-9` | Switch to window 1–9 | `<leader>?` | Show buffer-local keymaps |
| `<Leader>a` | Toggle symbol outline | `<leader>b` | Find open buffers |
| `<leader>cs` | Toggle cheatsheet | `<leader>df` | (Diffview) Toggle file panel |
| `<leader>e` | (Diffview) Focus file panel | `<leader>fb` | Find open buffers |
| `<leader>fe` | Open file browser | `<leader>ff` | Find files |
| `<leader>fg` | Grep text in open files | `<leader>fh` | Search help tags |
| `<leader>lca` | Code actions (normal) | `<leader>ldd` | Show buffer diagnostics |
| `<leader>lde` | List definitions | `<leader>lds` | List document symbols |
| `<leader>li` | List implementations | `<leader>lra` | Code actions (visual) |
| `<leader>lre` | List LSP references | `<leader>ltd` | List type definitions |
| `<leader>lwd` | Show workspace diagnostics | `<leader>lws` | List workspace symbols |
| `<leader>lx` | Workspace diagnostics (Lspsaga) | `<leader>lys` | List dynamic workspace symbols |
| `<leader>o` | Toggle outline | `<leader>t` | Focus outline |
| `<leader>vc` | Close Diffview | `<leader>vo` | Open Diffview |
| `<leader>vr` | Refresh Diffview | `<S-Tab>` | (Diffview) Previous file diff |
| `<space>D` | Go to type definition | `<space>f` | Format code |
| `<Tab>` | (Diffview) Next file diff | `-` | (Diffview) Stage/unstage entry |
| `gD` | Go to declaration | `gd` | Go to definition |
| `gf` | (Diffview) Open file in prev tabpage | `gi` | Go to implementation |
| `j` | (Diffview) Next file entry | `k` | (Diffview) Previous file entry |
| `R` | (Diffview) Refresh file list | `S` | (Diffview) Stage all entries |
| `U` | (Diffview) Unstage all entries | `X` | (Diffview) Restore to left side |
