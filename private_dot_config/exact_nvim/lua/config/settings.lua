local g = vim.g
local set = vim.opt

-- setting the leader keys
g.mapleader = "\\"
g.maplocalleader = "-"

-- keep gitgutter open
set.signcolumn = "yes"

-- line numbers
set.nu = true

-- settings on tabstops
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true

-- switch without saving buffer
set.hidden = true

-- in terminal mode, set esc to exit
vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', {silent=true, noremap=true})

-- switch between windows using the window number
for i = 1, 9
do
  vim.api.nvim_set_keymap('n', '<Leader>' .. i, ":" .. i .. 'wincmd w<CR>', {silent=true, noremap=true})
end

-- end highlight on esc
vim.api.nvim_set_keymap('n', '<ESC>', ':noh<return><esc>', {silent=true, noremap=true})

-- theme
set.termguicolors = true
vim.cmd("colorscheme nightfly")

-- copying to clipboard
vim.api.nvim_set_option("clipboard","unnamed")
