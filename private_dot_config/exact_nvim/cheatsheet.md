# Neovim Keymap Cheatsheet

## View by Plugin

### aerial.nvim
| Key(s) | Description |
| :--- | :--- |
| `<Leader>a` | Toggle symbol outline |

### codecompanion.nvim
| Key(s) | Description |
| :--- | :--- |
| `<leader>tt` | Toggle CodeCompanion Chat |

### nvim-tree.lua
| Key(s) | Description |
| :--- | :--- |
| `<C-p>` | Toggle file explorer |
| `ca` | (In NvimTree) Add file/dir to CodeCompanion |

### outline.nvim
| Key(s) | Description |
| :--- | :--- |
| `<leader>o` | Toggle outline |
| `<leader>t` | Focus outline |

### which-key.nvim
| Key(s) | Description |
| :--- | :--- |
| `<leader>?` | Show buffer-local keymaps |

### vim-slime
| Key(s) | Description |
| :--- | :--- |
| `<C-c><C-c>` | (Visual Mode) Send code to Slime/REPL |

### Telescope (Fuzzy Finder)
| Key(s) | Description |
| :--- | :--- |
| `<leader>ff` | Find files |
| `<leader>fg` | Grep text in open files |
| `<leader>fb` or `<leader>b` | Find open buffers |
| `<leader>fh` | Search help tags |
| `<leader>fe` | Open file browser |

### LSP (Language Server Protocol)
| Key(s) | Description |
| :--- | :--- |
| `gD` | Go to declaration |
| `gd` | Go to definition |
| `gi` | Go to implementation |
| `<C-k>` | Show signature help |
| `<space>D` | Go to type definition |
| `<space>f` | Format code |
| `<leader>lre` | List LSP references |
| `<leader>lds` | List document symbols |
| `<leader>lws` | List workspace symbols |
| `<leader>lys` | List dynamic workspace symbols |
| `<leader>lca` | List code actions |
| `<leader>ldd` | Show buffer diagnostics |
| `<leader>lwd` | Show workspace diagnostics |
| `<leader>li` | List implementations |
| `<leader>lde` | List definitions |
| `<leader>ltd` | List type definitions |

### DAP (Debug Adapter Protocol)
| Key(s) | Description |
| :--- | :--- |
| `<leader>db` | Toggle breakpoint |
| `<leader>dB` | Set conditional breakpoint |
| `<leader>dc` | Continue execution |
| `<leader>da` | Run with arguments |
| `<leader>dl` | Run last debug session |
| `<leader>di` | Step into |
| `<leader>do` | Step out |
| `<leader>dO` | Step over |
| `<leader>dr` | Toggle REPL |
| `<leader>du` | Toggle DAP UI |
| `<leader>de` | Evaluate expression |
| `<leader>dt` | Terminate session |
| `<leader>dPt` | Debug Python test method |
| `<leader>dPc` | Debug Python test class |

### General Settings
| Key(s) | Description |
| :--- | :--- |
| `\` | Leader key |
| `-` | Local leader key |
| `<Leader>1-9` | Switch to window 1-9 |
| `<ESC>` | (Normal Mode) Clear search highlight |
| `<ESC>` | (Terminal Mode) Exit terminal mode |

### Lspsaga
| Key(s) | Description |
| :--- | :--- |
| `<leader>lx` | Workspace Diagnostics (Lspsaga) |

## View by Key

| Key(s) | Description | Plugin |
| :--- | :--- | :--- |
| `<C-c><C-c>` | (Visual Mode) Send code to Slime/REPL | vim-slime |
| `<C-k>` | Show signature help | LSP |
| `<C-p>` | Toggle file explorer | nvim-tree.lua |
| `<ESC>` | (Normal Mode) Clear search highlight | General Settings |
| `<ESC>` | (Terminal Mode) Exit terminal mode | General Settings |
| `<Leader>1-9` | Switch to window 1-9 | General Settings |
| `<Leader>a` | Toggle symbol outline | aerial.nvim |
| `<leader>?` | Show buffer-local keymaps | which-key.nvim |
| `<leader>b` | Find open buffers | Telescope |
| `<leader>da` | Run with arguments | DAP |
| `<leader>db` | Toggle breakpoint | DAP |
| `<leader>dB` | Set conditional breakpoint | DAP |
| `<leader>dc` | Continue execution | DAP |
| `<leader>de` | Evaluate expression | DAP |
| `<leader>di` | Step into | DAP |
| `<leader>dl` | Run last debug session | DAP |
| `<leader>do` | Step out | DAP |
| `<leader>dO` | Step over | DAP |
| `<leader>dPc` | Debug Python test class | DAP |
| `<leader>dPt` | Debug Python test method | DAP |
| `<leader>dr` | Toggle REPL | DAP |
| `<leader>dt` | Terminate session | DAP |
| `<leader>du` | Toggle DAP UI | DAP |
| `<leader>fb` | Find open buffers | Telescope |
| `<leader>fe` | Open file browser | Telescope |
| `<leader>ff` | Find files | Telescope |
| `<leader>fg` | Grep text in open files | Telescope |
| `<leader>fh` | Search help tags | Telescope |
| `<leader>lca` | List code actions | LSP |
| `<leader>ldd` | Show buffer diagnostics | LSP |
| `<leader>lde` | List definitions | LSP |
| `<leader>lds` | List document symbols | LSP |
| `<leader>li` | List implementations | LSP |
| `<leader>lre` | List LSP references | LSP |
| `<leader>ltd` | List type definitions | LSP |
| `<leader>lwd` | Show workspace diagnostics | LSP |
| `<leader>lws` | List workspace symbols | LSP |
| `<leader>lx` | Workspace Diagnostics (Lspsaga) | Lspsaga |
| `<leader>lys` | List dynamic workspace symbols | LSP |
| `<leader>o` | Toggle outline | outline.nvim |
| `<leader>t` | Focus outline | outline.nvim |
| `<leader>tt` | Toggle CodeCompanion Chat | codecompanion.nvim |
| `<space>D` | Go to type definition | LSP |
| `<space>f` | Format code | LSP |
| `ca` | (In NvimTree) Add file/dir to CodeCompanion | nvim-tree.lua |
| `gD` | Go to declaration | LSP |
| `gd` | Go to definition | LSP |
| `gi` | Go to implementation | LSP |
