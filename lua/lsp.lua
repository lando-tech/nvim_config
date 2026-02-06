-- Configure diagnostics
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

-- LSP Keybindings
local function setup_lsp_keybindings(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
end

-- Setup language servers using vim.lsp.config (Nvim 0.11+)
vim.lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    on_attach = setup_lsp_keybindings,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

-- TypeScript/JavaScript
vim.lsp.config('ts_ls', {
    on_attach = setup_lsp_keybindings,
})

-- Tailwind CSS
vim.lsp.config('tailwindcss', {
    on_attach = setup_lsp_keybindings,
})

-- PHP/Laravel with Intelephense
vim.lsp.config('intelephense', {
    on_attach = setup_lsp_keybindings,
    settings = {
        intelephense = {
            files = {
                maxSize = 5000000,
            },
        },
    },
})

-- HTML
vim.lsp.config('html', {
    on_attach = setup_lsp_keybindings,
})

-- CSS
vim.lsp.config('cssls', {
    on_attach = setup_lsp_keybindings,
})

-- Enable all configured servers
vim.lsp.enable({ 'lua_ls', 'ts_ls', 'tailwindcss', 'intelephense', 'html', 'cssls' })
