-- Setup LSP

-- Ensure Python path
vim.g.python3_host_prog = '/usr/bin/python3'

-- Configure diagnostics
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        source = 'always',
    }
})

-- Function to show diagnostics in floating window
vim.o.updatetime = 250
vim.cmd([[ 
    autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false})
]])

-- LSP setup
local lspconfig = require'lspconfig'

-- Python (pyright)
lspconfig.pyright.setup{
  on_attach = on_attach
}

-- Lua LSP setup
lspconfig.lua_ls.setup {
  cmd = { '/home/landotech/lua-language-server/bin/lua-language-server' },  -- Use the global executable
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },  -- Neovim uses LuaJIT
      diagnostics = { globals = {'vim'}, severity_limit = "Warning"},  -- Recognize the 'vim' global
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },  -- Disable telemetry
    },
  },
}

-- Rust (rust_analyzer) setup
lspconfig.rust_analyzer.setup{
    on_attach = on_attach,
    settings = {
        ['rust-analyzer'] = {
            cargo = {
                allFeatures = true,
            },
            checkOnSave = {
                allFeatures = true,
                command = 'clippy',
            },
        }
    }
}

lspconfig.clangd.setup{
    cmd = { "clangd" },
    filetypes = { "c", "cpp" },
    root_dir = function(fname)
        return require'lspconfig'.util.root_pattern(
            'compile_commands.json',
            'compile_flags.txt',
            '.git'
        )(fname)
    end,
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

-- Setup neoformat using black for python
vim.g.neoformat_enabled_python = {'black'}

-- Autocommand to format on save for Python files
vim.cmd([[
  augroup fmt
    autocmd!
    autocmd BufWritePre *.py Neoformat
  augroup END
]])

