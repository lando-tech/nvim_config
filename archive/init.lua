-- Start Packer
require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'
  
  use 'nvim-lua/plenary.nvim'
  
  use 'terrortyler/nvim-comment'

  use 'L3MON4D3/LuaSnip'

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
  end
)
-- Enable line numbers
vim.wo.number = true

-- Map jj to exit Insert mode and go to Normal mode
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- Set up a keybind to toggle the file tree (Ctrl + n)
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Optional: Set relative line numbers (if you prefer)
vim.wo.relativenumber = true

-- Switch to the next buffer
vim.api.nvim_set_keymap('n', '<leader>n', ':bnext<CR>', { noremap = true, silent = true })

-- Switch to the previous buffer
vim.api.nvim_set_keymap('n', '<leader>p', ':bprevious<CR>', { noremap = true, silent = true })

-- Set escape for terminal mode
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

-- Run python script in a new terminal split below 
vim.api.nvim_set_keymap('n', '<leader>r', ':w | belowright split | resize -10 | :terminal python3 %<CR>', { noremap = true, silent = true })

-- Toggle folding on current line with spacebar
vim.api.nvim_set_keymap('n', '<space>', 'za', { noremap = true})

-- Set fold options 
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99
vim.opt.foldenable = true

-- Set indent settings
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.tabstop = 2
-- Autoclose brackets
vim.api.nvim_set_keymap('i', '(', '()<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '[', '[]<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '{', '{}<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '"', '""<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', "'", "''<Left>", { noremap = true })
vim.api.nvim_set_keymap('i', "<", "<>'<Left>", { noremap = true })

-- Enable true colors
vim.o.termguicolors = true

-- Enable line numbers
vim.wo.number = true

-- Optional: Set relative line numbers (if you prefer)
vim.wo.relativenumber = true

-- Set fold options 
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99
vim.opt.foldenable = true

-- Set indent settings
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.tabstop = 4

