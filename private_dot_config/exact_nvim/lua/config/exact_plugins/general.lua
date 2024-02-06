return {
    { 'nvim-tree/nvim-web-devicons', lazy=true },
    { 'nvim-lua/plenary.nvim', lazy=true },
    -- smart indentation
    { 'tpope/vim-sleuth', lazy=true},
    { "williamboman/mason.nvim", lazy=false, init=function() require("mason").setup() end},
}

