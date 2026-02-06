-- Enable true colors
vim.o.termguicolors = true

-- Enable line numbers
vim.wo.number = true

-- Disable gutter diagnostics
vim.wo.signcolumn = 'no'

-- Optional: Set relative line numbers (if you prefer)
vim.wo.relativenumber = true

-- Set cmd area height
-- vim.o.cmdheight = 3

-- Set fold options
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99
vim.opt.foldenable = true

-- Set indent settings
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.tabstop = 4

vim.o.showmatch = true
vim.api.nvim_set_hl(0, "MatchParen", {
  bg = "#3c2f4c",
  fg = "#ffffff",
  bold = true,
})

-- Enable spellcheck
vim.opt.spell = true

-- Set spellcheck language
vim.opt.spelllang = { 'en_us' }

