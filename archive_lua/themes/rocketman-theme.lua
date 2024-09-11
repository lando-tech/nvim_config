-- ~/.config/nvim/lua/themes/rocketman-theme.lua
local lush = require('lush')

return lush(function()
  return {
    Normal { fg = "#EAEAEA", bg = "#0A0A0F" },  -- Editor background and foreground
    Visual { bg = "#2D2D48" },  -- Selection background
    Cursor { fg = "#0A0A0F", bg = "#FFB74D" },  -- Caret color
    CursorLine { bg = "#161621" },  -- Line highlight

    -- Syntax
    Comment { fg = "#6D6D79" },
    Keyword { fg = "#FF9900" },
    String { fg = "#A1FF5F" },
    Function { fg = "#9A86FD" },
    Identifier { fg = "#E1E1FF" },
    Number { fg = "#FFEB3B" },
    Type { fg = "#66FFBB" },
    Constant { fg = "#F7D779" },

    -- Gutter
    LineNr { fg = "#5F5F7B", bg = "#131319" },

    -- Scrollbar
    ScrollbarThumb { bg = "#3E3E5E" },
    Scrollbar { bg = "#1C1C28" },

    -- Status line
    StatusLine { fg = "#B5B5B5", bg = "#0F0F14" },
  }
end)

