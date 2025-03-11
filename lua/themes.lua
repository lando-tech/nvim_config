vim.cmd.colorscheme("duskfox")

-- local function change_theme_time() 
--     local current_time = tonumber(os.date("%H")) 
--     local day_theme = " tokyonight-day"
--     local night_theme = " tokyonight-storm"
--
--     if current_time >= 6 and current_time < 18 then
--         vim.cmd("colorscheme" .. day_theme)
--     else
--         vim.cmd("colorscheme" .. night_theme)
--     end
-- end

-- local function change_theme_shortcut()
--     if vim.o.background == "dark" then
--         vim.o.background = "light"
--         vim.cmd("colorscheme tokyonight-day")
--     else 
--         vim.o.background = "dark"
--         vim.cmd("colorscheme tokyonight")
--     end
-- end


-- vim.keymap.set("n", "<leader>tt", change_theme_shortcut, { noremap = true, silent = true })
