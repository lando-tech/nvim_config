-- Prevent re-sourcing with lazy.nvim
if vim.g.loaded_config then
  vim.notify("Re-sourcing config is not supported with lazy.nvim. Please restart Neovim.", vim.log.levels.WARN)
  return
end
vim.g.loaded_config = true

-- Load custom settings
require('lazy_config')    -- Plugins management
require('lsp')        -- LSP and autocomplete setup
require('options')    -- General settings
require('keybindings')    -- Keybindings
require('themes')     -- Load Themes
require('filetypes')  -- File type configurations
