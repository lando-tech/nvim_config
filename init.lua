-- Options/Keymaps
-- Map jj to exit Insert mode and go to Normal mode
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- Set up a keybind to toggle the file tree (Ctrl + n)
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Switch tab next
vim.api.nvim_set_keymap('n', '<Tab>', ':tabnext', { noremap = true, silent = true})

-- Switch to the next buffer
vim.api.nvim_set_keymap('n', '<leader>n', ':bnext<CR>', { noremap = true, silent = true })

-- Switch to the previous buffer
vim.api.nvim_set_keymap('n', '<leader>p', ':bprevious<CR>', { noremap = true, silent = true })

-- Set escape for terminal mode
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

-- Run python script in a new terminal split below 
vim.api.nvim_set_keymap('n', '<leader>r', ':w | belowright split | resize -10 | :terminal python3 %<CR>', { noremap = true, silent = true })

-- Run lua script in new terminal
vim.api.nvim_set_keymap('n', '<leader>rl', ':w | belowright split | resize -10 | terminal lua %<CR>', { noremap = true, silent = true })

-- Toggle folding on current line with spacebar
vim.api.nvim_set_keymap('n', '<space>', 'za', { noremap = true})

-- Autoclose brackets
vim.api.nvim_set_keymap('i', '(', '()<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '[', '[]<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '{', '{}<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '"', '""<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', "'", "''<Left>", { noremap = true })
vim.api.nvim_set_keymap('i', "<", "<><Left>", { noremap = true })

-- Enable warp as default shell
-- vim.o.shell = "warp"

-- Enable true colors
vim.o.termguicolors = true

-- Enable line numbers
vim.wo.number = true

-- Optional: Set relative line numbers (if you prefer)
vim.wo.relativenumber = true

-- Set fold options 
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99
vim.opt.foldenable = true

-- Set indent settings
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.tabstop = 4

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

