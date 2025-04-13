local greeting = {}
greeting.loaded = false
greeting.buf, greeting.win = nil, nil

function greeting.launch_notepad()
    if not greeting.loaded or not vim.api.nvim_win_is_valid(greeting.win) then
        if not greeting.buf or not vim.api.nvim_buf_is_valid(greeting.buf) then
        greeting.buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_set_option_value("bufhidden", "hide", { buf = greeting.buf})
        vim.api.nvim_set_option_value("filetype", "markdown", { buf = greeting.buf})
        vim.api.nvim_buf_set_lines(greeting.buf, 0, 1, false, {
            "#Notepad",
            "",
            "> Notepad clears when the current Neovim session closes"
        })
        end

        greeting.win = vim.api.nvim_open_win(greeting.buf, true, {
            border = "rounded",
            relative = "editor",
            style = "minimal",
            height = math.ceil(vim.o.lines * 0.5),
            width = math.ceil(vim.o.columns * 0.5),
            row = 1,
            col = math.ceil(vim.o.columns * 0.5),
        })
        vim.api.nvim_set_option_value("winblend", 30, { win = greeting.win})

        local keymaps_opts = { silent = true, buffer = greeting.buf }
        vim.keymap.set("n", "<ESC>", function()
            greeting.launch_notepad()
        end, keymaps_opts)
        vim.keymap.set("n", "q", function()
        greeting.launch_notepad()
        end, keymaps_opts)
    else
        vim.api.nvim_win_hide(greeting.win)
    end
    greeting.loaded = not greeting.loaded
    return greeting
end

vim.keymap.set("n", "<leader>ll", greeting.launch_notepad, { noremap = true, desc = "Toggle Notepad"})

