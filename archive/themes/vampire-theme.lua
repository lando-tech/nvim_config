-- ColorScheme
local black = "#282A36"
local white = "#F8F8F2"
local grey = "#6272A4"
local blue = '#BD93F9'
local green = "#50FA7B"
local red = "#fb4934"
local yellow = "#F1FA8C"
local cyan = "#8BE9FD"
local orange = "#FFB86C"
local magenta = "#FF79C6"
local light_green = "#689d6a"
local dark_grey = "#44475A"

-- Colors for Lualine
local l_black = '#282828'
local l_red = '#cc241d'
local l_green = '#98971a'
local l_yellow = '#d79921'
local l_blue = '#458588'
local l_magenta = '#b16286'
local l_cyan  = '#689d6a'
local l_white = '#a89984'


local lush = require('lush')

return lush(function()
  return {
    Normal { fg = white, bg = black },  -- Editor background and foreground
    Visual { fg = black, bg = grey },  -- Selection background
    Cursor { fg = white, bg = black },  -- Caret color
    CursorLine { fg = black, bg = white },  -- Line highlight
    CursorLineNr { fg = black, bg = white },
    CursorColumn { fg = grey },
    ColorColumn { fg = white, bg = red },

    -- Comments 
    Comment { fg = grey },
    Keyword { fg = red },
    MatchParen { fg = white, bg = dark_grey },
    Todo { fg = black, bg = orange },

    -- Buffer Lines
    EndOfBuffer { fg = grey },

    -- Strings
    String { fg = cyan },

    -- Fold and Sign column
    FoldColumn { fg = black, bg = grey },
    Folded { fg = black, bg = grey },
    SignColumn { fg = black, bg = grey },
    WildMenu { fg = black, bg = yellow },
    Conceal { fg = white, bg = grey },

    -- Functions
    Function { fg = yellow },
    Identifier { fg = white },
    Type { fg = grey },
    Title { fg = blue },

    -- Constants
    Constant { fg = orange },
    Number { fg = orange },
    Character { fg = orange },
    Boolean { fg = orange },
    Float { fg = orange },

    -- Statement
    Statement { fg = red },
    Repeat { fg = red },
    Label { fg = white },
    Exception { fg = orange },

    -- Special 
    Special { fg = white },
    SpecialChar { fg = ""},
    Delimiter { fg = ""},
    SpecialComment { fg = ""},
    Debug { fg = ""},
    SpecialKey { fg = blue },

    NonText { fg = grey },
    Search { fg = white, bg = black },
    Tag { fg = white },
    Structure { fg = white },
    Operator { fg = "" },

    -- File System
    Directory { fg = grey, bg = black },

    -- Gutter
    LineNr { fg = grey, bg = black },

    -- Scrollbar
    ScrollbarThumb { bg = grey },
    Scrollbar { bg = black },

    -- Status line
    -- StatusLine { fg = grey , bg = black },
    -- StatusLineNC { fg = grey , bg = black },

    -- Proc
    PreProc { fg = magenta },
    Define { fg = white },
    Macro { fg = red },
    PreCondit { fg = grey },
    Include { fg = magenta },

    -- Nvim Tree
    NvimTreeRootFolder { fg = white },
    NvimTreeFolderName { fg = white },

    -- Nvim Internal
    NvimInternalError { fg = white, bg = yellow },

    -- Pmenu items
    Pmenu { fg = black, bg = grey },
    PmenuSel { fg = grey, bg = black },
    PmenuThumb { fg = grey, bg = dark_grey },
    PmenuSbar { fg = grey, bg = dark_grey },

    -- Warnings, Errors, Messages
    Error { fg = white, bg = orange },
    ErrorMsg { fg = white, bg = orange },
    WarningMsg { fg = orange },
    RedrawDebugClear { fg = light_green, bg = black },
    DiagnosticError { fg = black },
    DiagnosticWarn { fg = black },
    DiagnosticHint { fg = black },
    DiagnosticOk { fg = black },
    DiagnosticUnderlineError { cterm = false },
    DiagnosticUnderlineWarn { cterm = false },
    DiagnosticUnderlineInfo { cterm = false },
    DiagnosticUnderlineHint { cterm = false },
    Question { fg = white },
    MoreMsg { fg = white },
    RedrawBugRecompose { fg = white, bg = red },
    RedrawBugComposed { fg = white, bg = green },

    -- Diff
    DiffAdd { fg = white, bg = blue },
    DiffChange { fg = white, bg = blue },
    DiffDelete { fg = white, bg = orange },
    DiffText { fg = white, bg = orange },

    -- Tabline
    Tabline { fg = white, bg = grey },
    TablineFill { fg = white, bg = grey },

    -- Lualine options
    lualine_a_inactive { fg = white, bg = l_black },

    lualine_c_inactive  { fg = white, bg = l_black },

    lualine_b_inactive  { fg = white, bg = l_black },

    lualine_a_replace { fg = white, bg = l_black },

    lualine_c_replace { fg = white, bg = l_black },

    lualine_b_replace { fg = white, bg = l_black },

    lualine_a_normal { fg = white, bg = l_black },

    lualine_c_normal { fg = white, bg = l_black },

    lualine_b_normal { fg = white, bg = l_black },

    lualine_a_insert { fg = white, bg = l_black },

    lualine_c_insert { fg = white, bg = l_black },

    lualine_b_insert { fg = white, bg = l_black },

    lualine_a_visual { fg = white, bg = l_black },

    lualine_c_visual { fg = white, bg = l_black },

    lualine_b_visual { fg = white, bg = l_black },

    lualine_a_terminal { fg = white, bg = l_black },

    lualine_c_terminal { fg = white, bg = l_black },

    lualine_b_terminal { fg = white, bg = l_black },

    lualine_a_command { fg = white, bg = l_black },

    lualine_c_command { fg = white, bg = l_black },

    lualine_b_command { fg = white, bg = l_black },

    lualine_transitional_lualine_a_command_to_lualine_b_command { fg = white, bg = grey },

    lualine_transitional_lualine_a_command_to_lualine_c_command  { fg = white, bg = grey },

}
end)
