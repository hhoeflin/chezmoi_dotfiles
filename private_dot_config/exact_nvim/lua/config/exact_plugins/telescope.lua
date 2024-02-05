return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' },
      keys = {
        -- Searches
        { "<leader>ff", ":lua require('telescope.builtin').find_files()<cr>"},
        { "<leader>fg", ":lua require('telescope.builtin').live_grep({grep_open_files=true})<cr>"},
        { "<leader>fb", ":lua require('telescope.builtin').buffers()<cr>"},
        { "<leader>b", ":lua require('telescope.builtin').buffers()<cr>"},
        { "<leader>fh", ":lua require('telescope.builtin').help_tags()<cr>"},
        { "<leader>fe", ":lua require('telescope.builtin').file_browser()<cr>"},
        -- LSP
        { "<leader>lre", ":lua require('telescope.builtin').lsp_references()<cr>"},
        { "<leader>lds", ":lua require('telescope.builtin').lsp_document_symbols()<cr>"},
        { "<leader>lws", ":lua require('telescope.builtin').lsp_workspace_symbols()<cr>"},
        { "<leader>lys", ":lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>"},
        { "<leader>lca", ":lua require('telescope.builtin').lsp_code_actions()<cr>"},
        { "<leader>lra", ":lua require('telescope.builtin').lsp_range_code_actions()<cr>"},
        { "<leader>ldd", ":lua require('telescope.builtin').diagnostics({bufnr=0})<cr>"},
        { "<leader>lwd", ":lua require('telescope.builtin').diagnostics()<cr>"},
        { "<leader>li", ":lua require('telescope.builtin').lsp_implementations()<cr>"},
        { "<leader>lde", ":lua require('telescope.builtin').lsp_definitions()<cr>"},
        { "<leader>ltd", ":lua require('telescope.builtin').lsp_type_definitions()<cr>"},
      },
     cmd="Telescope", 
    }
