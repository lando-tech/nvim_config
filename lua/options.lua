-- Enable true colors
vim.o.termguicolors = true

-- Enable line numbers
vim.wo.number = true

-- Disable gutter diagnostics
-- vim.wo.signcolumn = 'no'

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


-- User functions 
function GetHighlightGroupUnderCursor()
    local line = vim.fn.line('.')
    local col = vim.fn.col('.')
    local synID = vim.fn.synID(line, col, 1)
    local synTransID = vim.fn.synIDtrans(synID)
    local highlight_group = vim.fn.synIDattr(synTransID, 'name')

    if highlight_group == "" then
        print("No highlight group found")
    else
        print("Highlight Group: " .. highlight_group)
    end
end

vim.api.nvim_set_keymap('n', '<leader>hg', ':lua GetHighlightGroupUnderCursor()<CR>', { noremap = true, silent = true })

-- Enable spellcheck
vim.opt.spell = true

-- Set spellcheck language
vim.opt.spelllang = { 'en_us' }

