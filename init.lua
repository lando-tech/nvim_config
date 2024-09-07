-- Packer configuration to manage plugins
-- Ensure packer is installed
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  use 'Shougo/deoplete.nvim'
  
  use 'deoplete-plugins/deoplete-jedi'
    
  use 'lukas-reineke/indent-blankline.nvim'
    require('ibl').setup()

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

-- Enable line numbers
vim.wo.number = true

-- Map jj to exit Insert mode and go to Normal mode
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- Set up a keybind to toggle the file tree (Ctrl + n)
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Optional: Set relative line numbers (if you prefer)
-- vim.wo.relativenumber = true

-- Switch to the next buffer
vim.api.nvim_set_keymap('n', '<leader>n', ':bnext<CR>', { noremap = true, silent = true })

-- Switch to the previous buffer
vim.api.nvim_set_keymap('n', '<leader>p', ':bprevious<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>r', ':w | belowright split | resize -10 | :terminal python3 %<CR>', { noremap = true, silent = true })

vim.g['deoplete#enable_at_startup'] = 1

vim.g['deoplete#sources#jedi#python_path'] = {'/home/landotech/Documents/GitHub/drawmate.me/.venv//bin/python3'}

