local g = vim.g
local set = vim.opt

-- disable mouse
set.mouse = ''

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

-- copying to clipboard
vim.api.nvim_set_option("clipboard","unnamed")

-- Automatically check and reload buffer if the file changed outside of Neovim
vim.opt.autoread = true
vim.api.nvim_create_autocmd({"BufEnter", "FocusGained"}, {
  command = "checktime"
})
