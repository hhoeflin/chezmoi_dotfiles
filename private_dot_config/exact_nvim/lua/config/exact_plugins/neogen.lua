return { 
    "danymat/neogen", 
    dependencies = "nvim-treesitter/nvim-treesitter", 
    opts = {
        enabled = true,
        languages = {
            python = {
                template = {
                    annotation_convention = "google_docstrings" -- for a full list of annotation_conventions, see supported-languages below,
                    }
            },
        }
    },
    cmd="Neogen",
}
