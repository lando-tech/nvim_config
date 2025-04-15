local notepad = {}
notepad.loaded = false
notepad.buf, notepad.win = nil, nil

function notepad.launch_notepad()
    if not notepad.loaded or not vim.api.nvim_win_is_valid(notepad.win) then
        if not notepad.buf or not vim.api.nvim_buf_is_valid(notepad.buf) then
        notepad.buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_set_option_value("bufhidden", "hide", { buf = notepad.buf})
        vim.api.nvim_set_option_value("filetype", "markdown", { buf = notepad.buf})
        vim.api.nvim_buf_set_lines(notepad.buf, 0, 1, false, {
            "#Notepad",
            "",
            "> Notepad clears when the current Neovim session closes"
        })
        end

        notepad.win = vim.api.nvim_open_win(notepad.buf, true, {
            border = "rounded",
            relative = "editor",
            style = "minimal",
            height = math.ceil(vim.o.lines * 0.5),
            width = math.ceil(vim.o.columns * 0.5),
            row = 1,
            col = math.ceil(vim.o.columns * 0.5),
        })
        vim.api.nvim_set_option_value("winblend", 30, { win = notepad.win})

        local keymaps_opts = { silent = true, buffer = notepad.buf }
        vim.keymap.set("n", "<ESC>", function()
            notepad.launch_notepad()
        end, keymaps_opts)
        vim.keymap.set("n", "q", function()
        notepad.launch_notepad()
        end, keymaps_opts)
    else
        vim.api.nvim_win_hide(notepad.win)
    end
    notepad.loaded = not notepad.loaded
    return notepad
end

vim.keymap.set("n", "<leader>ll", notepad.launch_notepad, { noremap = true, desc = "Toggle Notepad"})

function notepad.run_build_panel()
    -- Setup or reuse buffer
    if not notepad.buf or not vim.api.nvim_buf_is_valid(notepad.buf) then
        notepad.buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_set_option_value("bufhidden", "hide", { buf = notepad.buf })
        vim.api.nvim_set_option_value("filetype", "log", { buf = notepad.buf })
    end

    -- (Re)open the floating window
    if not notepad.loaded or not vim.api.nvim_win_is_valid(notepad.win) then
        notepad.win = vim.api.nvim_open_win(notepad.buf, true, {
            border = "rounded",
            relative = "editor",
            style = "minimal",
            height = math.ceil(vim.o.lines * 0.5),
            width = math.ceil(vim.o.columns * 0.5),
            row = 1,
            col = math.ceil(vim.o.columns * 0.5),
        })
        vim.api.nvim_set_option_value("winblend", 30, { win = notepad.win })
    else
        vim.api.nvim_win_hide(notepad.win)
        notepad.loaded = false
        return
    end

    notepad.loaded = true

    -- Clear buffer content
    vim.api.nvim_buf_set_lines(notepad.buf, 0, -1, false, { "[Running build...]" })

    -- Run the shell command asynchronously and write output into the buffer
    vim.fn.jobstart({ "sh", "-c", "make && ./bin/main" }, {
        stdout_buffered = true,
        stderr_buffered = true,
        on_stdout = function(_, data)
            if data then
                vim.schedule(function()
                    vim.api.nvim_buf_set_lines(notepad.buf, -1, -1, false, data)
                end)
            end
        end,
        on_stderr = function(_, data)
            if data then
                vim.schedule(function()
                    vim.api.nvim_buf_set_lines(notepad.buf, -1, -1, false, data)
                end)
            end
        end,
        on_exit = function()
            vim.schedule(function()
                vim.api.nvim_buf_set_lines(notepad.buf, -1, -1, false, { "", "[Build finished]" })
            end)
        end,
    })
end

vim.keymap.set("n", "<F5>", notepad.run_build_panel, { desc = "Build & Run in IDE panel" })

