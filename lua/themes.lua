vim.cmd.colorscheme("duskfox")

local function change_theme_time() 
    local current_time = tonumber(os.date("%H")) 
    local day_theme = " dayfox"
    local night_theme = " carbonfox"

    if current_time >= 6 and current_time < 18 then
        vim.cmd("colorscheme" .. day_theme)
    else
        vim.cmd("colorscheme" .. night_theme)
    end
end

local function change_theme_shortcut()
    if vim.o.background == "dark" then
        vim.o.background = "light"
        vim.cmd("colorscheme dayfox")
    else 
        vim.o.background = "dark"
        vim.cmd("colorscheme duskfox")
    end
end


vim.keymap.set("n", "<leader>tt", change_theme_shortcut, { noremap = true, silent = true })
