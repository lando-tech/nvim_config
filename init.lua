-- Packer configuration to manage plugins
-- Ensure packer is installed
vim.cmd [[packadd packer.nvim]]

-- Manage Packages Using Packer
require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'

  use 'nvim-lua/plenary.nvim'

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
end)

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

-- Setup LSP

-- Ensure Python path
vim.g.python3_host_prog = '/usr/bin/python3'

-- LSP setup
local lspconfig = require'lspconfig'

-- Python (pyright)
lspconfig.pyright.setup{
  on_attach = on_attach
}

-- Lua LSP setup
lspconfig.lua_ls.setup {
  cmd = { 'lua-language-server' },  -- Use the global executable
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },  -- Neovim uses LuaJIT
      diagnostics = { globals = {'vim'} },  -- Recognize the 'vim' global
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },  -- Disable telemetry
    },
  },
}

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
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
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

-- Run lua script in new terminal
vim.api.nvim_set_keymap('n', '<leader>rl', ':w | belowright split | resize -10 | terminal lua %<CR>', { noremap = true, silent = true })

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
vim.cmd("highlight Normal guibg=#1B1B23 guifg=#D4D4D8")  -- Background and foreground
vim.cmd("highlight Visual guibg=#3C3C58")  -- Selection background
vim.cmd("highlight Cursor guifg=#1B1B23 guibg=#FFA07A")  -- Caret color (cursor)
vim.cmd("highlight CursorLine guibg=#2A2A3B")  -- Line highlight

-- Syntax colors
vim.cmd("highlight Comment guifg=#666699")  -- Comments
vim.cmd("highlight Keyword guifg=#569fd7")
vim.cmd("highlight String guifg=#5fd756")
vim.cmd("highlight Identifier guifg=#d78e56")
vim.cmd("highlight Type guifg=#FFC300 ")
vim.cmd("highlight Number guifg=#cf56d7")
vim.cmd("highlight Constant guifg=#cf56d7")
vim.cmd("highlight Conditional guifg=f5ece6")
vim.cmd("highlight Repeat guifg=#e6eff5")
vim.cmd("highlight Statement guifg=#569fd7")
vim.cmd("highlight Punctuation guifg=#569fd7")
vim.cmd("highlight Delimiter guifg=#569fd7")

-- Popup menu background and foreground
vim.cmd("highlight Pmenu guibg=#2E3440 guifg=#D8DEE9")

-- Popup menu selected item
vim.cmd("highlight PmenuSel guibg=#88C0D0 guifg=#2E3440")

-- Popup menu scrollbar
vim.cmd("highlight PmenuSbar guibg=#3B4252")
vim.cmd("highlight PmenuThumb guibg=#81A1C1")

-- Gutter (line numbers)
vim.cmd("highlight LineNr guibg=#1F1F28 guifg=#DAF7A6 ")

-- Scrollbar colors
vim.cmd("highlight ScrollbarThumb guibg=#4E4E6A")
vim.cmd("highlight Scrollbar guibg=#2C2C3C")

-- StatusBar (you can use lualine or another statusline plugin)
vim.cmd("highlight StatusLine guibg=#2A2A3A guifg=#B0B0B8")
vim.cmd("highlight NvimTreeRootFolder guifg=#FF5733")
vim.cmd("highlight NvimTreeFolderName guifg=#B19CD9")
vim.cmd("highlight EndOfBuffer guifg=#900C3F")

