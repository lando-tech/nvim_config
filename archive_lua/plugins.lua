-- Packer configuration to manage plugins
-- Ensure packer is installed
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  use 'neovim/nvim-lspconfig'

  use {
    'rktjmp/lush.nvim',
    config = function()
      require('lush')(require('themes.rocketman-theme'))
    end
  }
  use {
    'hrsh7th/nvim-cmp', -- Completion Plugin
    requires = {
      'hrsh7th/cmp-nvim-lsp',     -- LSP source for nvim-cmp
      'hrsh7th/cmp-buffer',       -- Buffer completions
      'hrsh7th/cmp-path',         -- Path completions
      'hrsh7th/cmp-cmdline',      -- Command-line completions
      'hrsh7th/cmp-nvim-lua',     -- Neovim Lua API completions
      'L3MON4D3/LuaSnip',         -- Snippet engine
      'saadparwaiz1/cmp_luasnip', -- Snippet completions 
    }
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('ibl').setup()
    end
  }
  -- File tree plugin
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
      require("nvim-tree").setup {}
    end
  }
end)


