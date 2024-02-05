return { 
    "lukas-reineke/indent-blankline.nvim", 
    main = "ibl", 
    opts = {
        exclude = {
             filetypes = {
                 'lspinfo',
                 'packer',
                 'checkhealth',
                 'help',
                 'man',
                 'dashboard',
                 '',
             },
              -- filetypes = vim.g.exclude_filetypes,
        },
    } 
}
