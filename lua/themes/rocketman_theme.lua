-- ColorScheme
local black = "#131319"
local white = "#eceff1"
local light_grey = "#e3e8eb"
local grey = "#90a4ae"
local blue = "#7fb3d5"
local green = "#7dcea0"
local purple = "#7e57c2"
local light_purple = "#ce93d8"
local pink = "#ce93d8"
local bg_grey = "#263238"
local bg_2 = "#313136"
local dark_red = "#cc3359"
local lime = "#dce775"
local dark_orange = "#ff6e40" 
local violet = "#7986cb"
local white_grey = "#e2e2e2"
local olive = "#afb42b"
local cyan_1 = "#00838f"

local lush = require('lush')

return lush(function()
  return {
    Normal { fg = white, bg = bg_2 },  -- Editor background and foreground
    Visual { fg = black, bg = grey },  -- Selection background
    Cursor { fg = white, bg = black },  -- Caret color
    CursorLine { fg = black, bg = grey },  -- Line highlight
    CursorLineNr { fg = black, bg = grey },
    CursorColumn { fg = black, bg = grey },
    ColorColumn { fg = white, bg = dark_red },

    -- Comments 
    Comment { fg = grey },
    Keyword { fg = cyan_1 },
    MatchParen { fg = black, bg = grey },

    -- Buffer Lines
    EndOfBuffer { fg = grey },

    -- Strings
    String { fg = green },

    -- Fold and Sign column
    FoldColumn { fg = black, bg = grey },
    Folded { fg = black, bg = grey },
    SignColumn { fg = black, bg = grey },
    WildMenu { fg = lime, bg = black },
    Conceal { fg = white, bg = grey },

    -- Functions
    Function { fg = olive },
    Identifier { fg = light_grey },
    Type { fg = light_grey },
    Title { fg = blue },

    -- Constants
    Constant { fg = dark_orange },
    Number { fg = dark_orange },
    Character { fg = grey },
    Boolean { fg = dark_orange },
    Float { fg = dark_orange },
    
    -- Statement
    Statement { fg = cyan_1 },
    Repeat { fg = cyan_1 },
    Label { fg = light_grey },
    Exception { fg = olive },

    -- Special 
    Special { fg = olive },
    SpecialChar { fg = ""},
    Delimiter { fg = ""},
    SpecialComment { fg = ""},
    Debug { fg = ""},
    SpecialKey { fg = light_purple },

    NonText { fg = grey },
    Search { fg = lime, bg = black },
    Tag { fg = light_grey },
    Structure { fg = light_grey },
    Operator { fg = "" },

    -- File System
    Directory { fg = grey, bg = black },

    -- Gutter
    LineNr { fg = grey, bg = black },

    -- Scrollbar
    ScrollbarThumb { bg = grey },
    Scrollbar { bg = black },

    -- Status line
    StatusLine { fg = grey , bg = black },
    StatusLineNC { fg = grey , bg = black },

    -- Proc
    PreProc { fg = violet },
    Define { fg = white },
    Macro { fg = dark_red },
    PreCondit { fg = light_grey },
    Include { fg = olive},

    -- Nvim Tree
    NvimTreeRootFolder { fg = white },
    NvimTreeFolderName { fg = white },

    -- Nvim Internal
    NvimInternalError { fg = white, bg = olive },
    
    -- Pmenu items
    Pmenu { fg = grey, bg = black },
    PmenuSel { fg = black, bg = grey },
    PmenuThumb { fg = grey, bg = bg_2 },
    PmenuSbar { fg = grey, bg = bg_2 },

    -- Warnings, Errors, Messages
    Error { fg = white, bg = dark_orange },
    ErrorMsg { fg = white, bg = dark_orange },
    WarningMsg { fg = dark_orange },
    RedrawDebugClear { fg = lime, bg = black },
    DiagnosticError { fg = dark_orange },
    DiagnosticUnderlineError { cterm = false },
    DiagnosticUnderlineWarn { cterm = false },
    DiagnosticUnderlineInfo { cterm = false },
    DiagnosticUnderlineHint { cterm = false },
    Question { fg = white },
    MoreMsg { fg = white },
    RedrawBugRecompose { fg = white, bg = dark_red },
    RedrawBugComposed { fg = white, bg = green },


    -- Diff
    DiffAdd { fg = white, bg = blue },
    DiffChange { fg = white, bg = blue },
    DiffDelete { fg = white, bg = dark_orange },
    DiffText { fg = white, bg = dark_orange },

    -- Tabline
    Tabline { fg = white, bg = grey },
    TablineFill { fg = white, bg = grey },

}
end)

