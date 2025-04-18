-- Setup LSP and autocomplete

-- Ensure Python path
vim.g.python3_host_prog = '/home/landotech/.config/nvim/venv/bin/python3'

-- Activate virtual env
local function activate_venv()
    local venv_path = vim.fn.stdpath("config") .. "/nvim/venv/bin/activate"

    if vim.fn.filereadable(venv_path) == 1 then
        vim.cmd("silent !source " .. venv_path)
        print("Centralized virtual environment activated")
    end
end

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.py",
    callback = activate_venv,
})

-- Configure diagnostics
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    -- float = {
    --     source = 'always',
    -- }
})

-- Function to show diagnostics in floating window
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, {
            focusable = false,
            close_events = {"BufLeave", "CursorMoved", "InsertEnter", "FocusLost"},
            border = "rounded",
            source = "always",
            prefix = " ",
            scope = "cursor",
        })
    end
})

-- LSP setup
local lspconfig = require'lspconfig'

-- Lua Lsp
require('lspconfig').lua_ls.setup({
  cmd = { "/home/landotech/src/lua-language-server/bin/lua-language-server"},
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

-- Clangd setup
require('lspconfig').clangd.setup{
    cmd = {
        "clangd",
        "--completion-style=detailed",  -- Options: detailed, bundled, plain
        "--limit-results=10",           -- Limit the number of suggestions
        "--log=error",                  -- Reduce log verbosity
        "--header-insertion=never",     -- Avoid auto-inserting headers
        "--header-insertion-decorators=false",
        "--all-scopes-completion=false" -- Disable suggestions from all scopes
    },
    filetypes = { "c", "cpp" },
    root_dir = function(fname)
        return require('lspconfig').util.root_pattern(
            'compile_commands.json',
            'compile_flags.txt',
            '.git'
        )(fname)
    end,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    on_attach = function(client, bufnr)
        -- Disable intrusive features
        client.server_capabilities.signatureHelpProvider = false
        client.server_capabilities.documentFormattingProvider = false
    end,
    flags = {
        debounce_text_changes = 150,  -- Reduce how often diagnostics are updated
    },
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                underline = true,
                update_in_insert = false, -- Don't show diagnostics while typing
                virtual_text = {
                    spacing = 4,
                    severity_limit = "Warning", -- Only show warnings and errors
                },
                signs = true,
            }
        ),
    }
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

