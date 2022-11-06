-- load packer
require('config.packer')

-- general settings
require('config.settings')

-- lualine
require('lualine').setup(
  {
    sections = {
      lualine_c = {
        {
          'filename',
          file_status = true,  -- displays file status (readonly status, modified status)
          path = 1,            -- 0 = just filename, 1 = relative path, 2 = absolute path
          shorting_target = 40 -- Shortens path to leave 40 space in the window
                               -- for other components. Terrible name any suggestions?
        }
      }
    }
  }
)

-- startify screen
local alpha = require'alpha'
local startify = require'alpha.themes.startify'
startify.nvim_web_devicons.enabled = false
alpha.setup(startify.opts)

-- ale
require('config.ale')

-- null-ls
require('config.null_ls.init')

-- nvim-tree
require('nvim-tree').setup({
  update_focused_file = {
    enable      = true,
    update_cwd  = true,
    ignore_list = {}
  },
  renderer= {
    root_folder_modifier = ":t"
  }
})
local map = vim.api.nvim_set_keymap
map('n', '<C-p>', ':NvimTreeToggle <CR>', {noremap=true;})

-- lsp
require('config.lsp_compe')

-- treesitter
require('config.treesitter')

-- telescope
require('config.telescope')

-- neogen
require('neogen').setup {
    enabled = true,
    languages = {
        python = {
            template = {
                annotation_convention = "google_docstrings" -- for a full list of annotation_conventions, see supported-languages below,
                }
        },
    }
}

-- lspsaga
require('config.lspsaga')
