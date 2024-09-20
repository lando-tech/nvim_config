-- Set theme options

-- Editor colors
-- vim.cmd("highlight Normal guibg=1e292f guifg=#d3dcd0")  -- Background and foreground
-- vim.cmd("highlight Visual guibg=#3C3C58")  -- Selection background
-- vim.cmd("highlight Cursor guifg=#1B1B23 guibg=#FFA07A")  -- Caret color (cursor)
-- vim.cmd("highlight CursorLine guibg=#2A2A3B")  -- Line highlight
--
-- -- Syntax colors
-- vim.cmd("highlight Comment guifg=#666699")  -- Comments
-- vim.cmd("highlight Keyword guifg=#569fd7")
-- vim.cmd("highlight String guifg=#75b98a")
-- vim.cmd("highlight Identifier guifg=#d78e56")
-- vim.cmd("highlight Type guifg=#FFC300 ")
-- vim.cmd("highlight Number guifg=#cf56d7")
-- vim.cmd("highlight Constant guifg=#cf56d7")
-- vim.cmd("highlight Conditional guifg=#f5ece6")
-- vim.cmd("highlight Repeat guifg=#e6eff5")
-- vim.cmd("highlight Statement guifg=#569fd7")
-- vim.cmd("highlight Punctuation guifg=#569fd7")
-- vim.cmd("highlight Delimiter guifg=#569fd7")
--
-- -- Popup menu background and foreground
-- vim.cmd("highlight Pmenu guibg=#2E3440 guifg=#D8DEE9")
--
-- -- Popup menu selected item
-- vim.cmd("highlight PmenuSel guibg=#88C0D0 guifg=#2E3440")
--
-- -- Popup menu scrollbar
-- vim.cmd("highlight PmenuSbar guibg=#3B4252")
-- vim.cmd("highlight PmenuThumb guibg=#81A1C1")
--
-- -- Gutter (line numbers)
-- vim.cmd("highlight LineNr guibg=#1F1F28 guifg=#d0d9dc ")
--
-- -- Scrollbar colors
-- vim.cmd("highlight ScrollbarThumb guibg=#4E4E6A")
-- vim.cmd("highlight Scrollbar guibg=#2C2C3C")
--
-- -- StatusBar (you can use lualine or another statusline plugin)
-- vim.cmd("highlight StatusLine guibg=#2A2A3A guifg=#B0B0B8")
-- vim.cmd("highlight NvimTreeRootFolder guifg=#FF5733")
-- vim.cmd("highlight NvimTreeFolderName guifg=#B19CD9")
-- vim.cmd("highlight EndOfBuffer guifg=#900C3F")

-- ~/.config/nvim/lua/themes/rocketman_theme.lua
local lush = require('lush')

return lush(function()
  return {
    Normal { fg = "#EAEAEA", bg = "#19191A" },  -- Editor background and foreground
    Visual { bg = "#2D2D48" },  -- Selection background
    Cursor { fg = "#0A0A0F", bg = "#FFB74D" },  -- Caret color
    CursorLine { bg = "#161621" },  -- Line highlight

    -- Syntax
    Comment { fg = "#6D6D79" },
    Keyword { fg = "#FF9900" },
    String { fg = "#00ff55" },
    Function { fg = "#9A86FD" },
    Identifier { fg = "#E1E1FF" },
    Number { fg = "#c10bb5" },
    Type { fg = "#66b3ff" },
    Title { fg = "#c94212"},
    Constant { fg = "#F7D779" },
    Statement { fg = "#cc3359"},
    Special { fg = "#d26f2d"},

    -- Gutter
    LineNr { fg = "#5F5F7B", bg = "#131319" },

    -- Scrollbar
    ScrollbarThumb { bg = "#3E3E5E" },
    Scrollbar { bg = "#1C1C28" },

    -- Status line
    StatusLine { fg = "#B5B5B5", bg = "#0F0F14" },

    PreProc { fg = "#cc3359"},

    NvimTreeRootFolder { fg = "#99e6ff"},

    Pmenu { bg = "#141f1f"}

  }
end)


