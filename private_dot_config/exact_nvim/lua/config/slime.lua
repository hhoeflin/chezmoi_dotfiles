vim.g.slime_bracketed_paste = 1
vim.g.slime_target = "tmux"

-- remap so that it jumps to the end of the executed code
--vim.api.nvim_set_keymap('x', '<c-c><c-c>', '<Plug>SlimeRegionSend gv<esc>', {silent=true, noremap=true})
--vim.api.nvim_set_keymap('n', '<c-c><cr>', '<c-c><c-c>}j', {silent=true, noremap=false})
