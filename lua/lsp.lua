-- Setup LSP and autocomplete

-- Configure diagnostics
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    -- float = {
    --     source = 'always',
    -- }
})


-- LSP setup
local lspconfig = require('lspconfig')

-- Lua Lsp
lspconfig.lua_ls.setup({
  cmd = { "lua-language-server"},
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT', -- Or "Lua 5.1" if you prefer
      },
      diagnostics = {
        globals = { 'vim' }, -- Prevent warnings about 'vim'
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false, -- Disable third-party checks
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

-- Python (pylsp)
lspconfig.pylsp.setup{
  on_attach = on_attach,
  settings = {
    pylsp = {
    plugins = {
        black = { enabled = true },
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        pylint = { enabled = true, executable = "pylint" },
        pyflakes = { enabled = false },
        pycodestyle = { enabled = false },
        pylsp_mypy = { enabled = true },
        jedi_completion = { fuzzy = true },
        pyls_isort = { enabled = true },
    },
    },
  },
  flags = {
    debounce_text_changes = 200,
  },
  capabilities = capabilities,
}

-- Setup neoformat using black for python
vim.g.neoformat_enabled_python = {'black'}

-- Autocommand to format on save for Python files
vim.cmd([[
  augroup fmt
    autocmd!
    autocmd BufWritePre *.py Neoformat
  augroup END
]])

-- Rust (rust-analyzer)
lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy",
      },
    },
  },
})

-- Ruby (ruby-lsp)
lspconfig.ruby_lsp.setup({
  init_options = {
    formatter = 'standard',
    linters = { 'standard' },
  },
})


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

