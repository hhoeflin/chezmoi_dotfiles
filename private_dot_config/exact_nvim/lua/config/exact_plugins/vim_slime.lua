return {
    'jpalardy/vim-slime',
    lazy=true,
    keys={
        {'<C-c><C-c>'},
        {'<C-c>v'}
    },
    config=function()
        vim.g.slime_bracketed_paste = 1
        vim.g.slime_target = "tmux"
    end,

}
