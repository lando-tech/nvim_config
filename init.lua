-- Packer configuration to manage plugins
-- Ensure packer is installed
vim.cmd [[packadd packer.nvim]]

-- Manage Packages Using Packer
require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  use 'neovim/nvim-lspconfig'
   
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

-- Setup LSP

-- Ensure Python path
vim.g.python3_host_prog = '/usr/bin/python3'

-- Ensure Java path
vim.g.java_home = '/usr/lib/jvm/java-21-openjdk-amd64/bin/java'

-- Run java
vim.cmd('let $JAVA_HOME = "' .. vim.g.java_home .. '"')

-- LSP setup
local lspconfig = require'lspconfig'

-- Python (pyright)
lspconfig.pyright.setup{}

-- Java (JDTLS)
lspconfig.jdtls.setup{}

-- Setup nvim-cmp
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- Luasnip for snippet support
    end,
    },
  mapping = {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept completion
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp'},
    { name = 'luasnip'},
    { name = 'buffer'},
  })
})

-- Use buffer source for '/' search completion 
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer'}
  }
})

-- Use cmdline and path source for ':' command-line completion
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path'},
    { name = 'cmdline'},
  })
})

-- Mappings.
local on_attach = function(_, bufnr)
  local opts = { noremap=true, silent=true }
  
  -- Keymaps for LSP
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
end

-- Pass `on_attach` to the LSP setup
local lspconfig = require'lspconfig'

lspconfig.pyright.setup{
  on_attach = on_attach
}

local jdtls_path = '/usr/lib/jvm/java-21-openjdk-amd64/bin/java'


lspconfig.jdtls.setup{
    cmd = {jdtls_path .. "/bin/java", "-Declipse.application=org.eclipse.jdt.ls.core.id1", "-Dosgi.bundles.defaultStartLevel=4", "-Declipse.product=org.eclipse.jdt.ls.core.product"},
    ...
}


-- Options/Keymaps

-- Map jj to exit Insert mode and go to Normal mode
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- Set up a keybind to toggle the file tree (Ctrl + n)
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })


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

-- Autoclose brackets
vim.api.nvim_set_keymap('i', '(', '()<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '[', '[]<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '{', '{}<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '"', '""<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', "'", "''<Left>", { noremap = true })

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

-- Set theme options

-- Editor colors
vim.cmd("highlight Normal guibg=#0A0A0F guifg=#EAEAEA")  -- Background and foreground
vim.cmd("highlight Visual guibg=#2D2D48")  -- Selection background
vim.cmd("highlight Cursor guifg=#0A0A0F guibg=#FFB74D")  -- Caret color (cursor)
vim.cmd("highlight CursorLine guibg=#161621")  -- Line highlight

-- Syntax colors
vim.cmd("highlight Comment guifg=#6D6D79")  -- Comments
vim.cmd("highlight Keyword guifg=#FF9900")  -- Keywords
vim.cmd("highlight String guifg=#A1FF5F")   -- Strings
vim.cmd("highlight Function guifg=#B19CD9") -- Functions
vim.cmd("highlight Identifier guifg=#E1E1FF") -- Variables
vim.cmd("highlight Number guifg=#FFEB3B")   -- Numbers
vim.cmd("highlight Type guifg=#66FFBB")     -- Types
vim.cmd("highlight Constant guifg=#F7D779") -- Constants
vim.cmd("highlight NvimTreeRootFolder guifg=#B19CD9")  -- Softer Purple for the root folder
vim.cmd("highlight NvimTreeFolderName guifg=#B19CD9")  -- Softer Purple for folder names

-- Gutter (line numbers)
vim.cmd("highlight LineNr guibg=#131319 guifg=#5F5F7B") -- Gutter background and foreground

-- Scrollbar colors (assuming you have a plugin to customize scrollbars)
vim.cmd("highlight ScrollbarThumb guibg=#3E3E5E")  -- Scrollbar thumb color
vim.cmd("highlight Scrollbar guibg=#1C1C28")       -- Scrollbar track color

-- StatusBar (you can use lualine or another statusline plugin)
vim.cmd("highlight StatusLine guibg=#0F0F14 guifg=#B5B5B5") -- Status bar background and foreground

