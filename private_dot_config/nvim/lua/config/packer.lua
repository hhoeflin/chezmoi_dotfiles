local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({function(use)
  use 'wbthomason/packer.nvim'

  -- THEMES
  use 'catppuccin/catppuccin'
  use 'bluz71/vim-nightfly-guicolors'
  use 'dracula/vim'
  use 'kyazdani42/nvim-palenight.lua'
  use 'NLKNguyen/papercolor-theme'

  -- automatic docs generation
  use 'danymat/neogen'

  -- smart indentation
  use 'tpope/vim-sleuth'

  -- file tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- completion
  use 'hrsh7th/nvim-compe'
  use 'L3MON4D3/LuaSnip'
  -- use 'tzachar/compe-tabnine'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'ray-x/lsp_signature.nvim'
  use 'glepnir/lspsaga.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'sbdchd/neoformat'
  use 'mfussenegger/nvim-lint'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Various
  use 'goolord/alpha-nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'lukas-reineke/indent-blankline.nvim'

  use 'ggandor/leap.nvim'
  use 'purescript-contrib/purescript-vim'
  --use {
  --  "folke/noice.nvim",
  --  event = "VimEnter",
  --  config = function()
  --    require("noice").setup()
  --  end,
  --  requires = {
  --    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --    "MunifTanjim/nui.nvim",
  --    -- OPTIONAL:
  --    --   `nvim-notify` is only needed, if you want to use the notification view.
  --    --   If not available, we use `mini` as the fallback
  --    "rcarriga/nvim-notify",
  --    }
  --}


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end, 
config={
  snapshot_path=vim.fn.stdpath('config') .. '/packer_snapshots'
  }
})
