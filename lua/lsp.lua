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


