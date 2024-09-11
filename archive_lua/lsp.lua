-- Ensure Python path
vim.g.python3_host_prog = '/usr/bin/python3'

-- LSP setup
local lspconfig = require'lspconfig'

-- Python (pyright)
lspconfig.pyright.setup{}

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


