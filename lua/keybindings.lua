-- Options/Keymaps

-- Map jj to exit Insert mode and go to Normal mode
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- Set up a keybind to toggle the file tree (Ctrl + n)
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Switch to the next buffer
vim.api.nvim_set_keymap('n', '<leader>n', ':bnext<CR>', { noremap = true, silent = true })

-- Switch to the previous buffer
vim.api.nvim_set_keymap('n', '<leader>p', ':bprevious<CR>', { noremap = true, silent = true })

-- Toggle folding on current line with spacebar
vim.api.nvim_set_keymap('n', '<space>', 'za', { noremap = true})

-- Autoclose brackets
vim.api.nvim_set_keymap('i', '(', '()<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '[', '[]<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '{', '{}<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '"', '""<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', "'", "''<Left>", { noremap = true })

-- Telescope keybindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = "Find files"})

-- Configure toggle comment block
require('nvim_comment').setup({
    line_mapping = "<leader>cc",  -- Map to comment current line
    operator_mapping = "<leader>c",  -- Map for commenting in visual mode
})


