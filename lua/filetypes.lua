-- File type autocommands for better language support
local augroup = vim.api.nvim_create_augroup("FileTypeSetup", { clear = true })

-- Blade templates (Laravel)
vim.api.nvim_create_autocmd("BufRead", {
  group = augroup,
  pattern = "*.blade.php",
  command = "set filetype=blade"
})

-- Vue files
vim.api.nvim_create_autocmd("BufRead", {
  group = augroup,
  pattern = "*.vue",
  command = "set filetype=vue"
})

-- PHP files
vim.api.nvim_create_autocmd("BufRead", {
  group = augroup,
  pattern = "*.php",
  command = "set filetype=php"
})
