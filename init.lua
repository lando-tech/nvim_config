-- FIX: Telescope ft_to_lang nil error for Neovim 0.10+
-- This shims the deleted function so Telescope version 0.1.8 works anyway
local ts_utils = vim.treesitter.language
if ts_utils and not ts_utils.ft_to_lang then
    ts_utils.ft_to_lang = function(ft)
        return vim.treesitter.language.get_lang(ft) or ft
    end
end

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
