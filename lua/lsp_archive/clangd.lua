-- Clangd setup
local lspconfig = require("lspconfig")
lspconfig.clangd.setup{
    cmd = {
        "clangd",
        "--completion-style=detailed",  -- Options: detailed, bundled, plain
        "--limit-results=10",           -- Limit the number of suggestions
        "--log=error",                  -- Reduce log verbosity
        -- "--header-insertion=never",     -- Avoid auto-inserting headers
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
    -- on_attach = function(client, bufnr)
    --     -- Disable intrusive features
    --     client.server_capabilities.signatureHelpProvider = false
    --     client.server_capabilities.documentFormattingProvider = false
    -- end,
    -- flags = {
    --     debounce_text_changes = 150,  -- Reduce how often diagnostics are updated
    -- },
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                underline = true,
                update_in_insert = false, -- Don't show diagnostics while typing
                -- virtual_text = {
                --     spacing = 4,
                --     severity_limit = "Warning", -- Only show warnings and errors
                -- },
                signs = true,
            }
        ),
    }
}


