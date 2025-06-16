" VIM OPTIONS 

colorscheme elflord

" Disable compatibility mode with vi
set nocompatible

" Enable filetype detection
filetype on

" Enable plugins
filetype plugin on

" Load an indent for selected filetype
filetype indent on

" Turn syntax highlighting on
syntax on

" Add line numbers
set number

" Add cursor line to highlight current line
" set cursorline

" Set shiftwidth to 4 spaces
set shiftwidth=4

" Set tab width to 4 columns
set tabstop=4

" Use space characters instead of tabs
set expandtab

" Do not save backup files
set nobackup

" Do not wrap lines
set nowrap

" Hightlight characters while searching through a file
set incsearch

" Ignore capital letters during search
set ignorecase

" Show matching words during a search
set showmatch

"Use highlighting when doing a search
set hlsearch

" Enable autocompletion menu after pressing tab
set wildmenu

" Make wildmenu behave similar to Bash
set wildmode=list:longest

" MAPPINGS 
inoremap jj <Esc>

" VIMSCRIPT 
" Enable code folding
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END


" STATUS LINE 
set statusline=

set statusline+=\ %F\ %M\ %Y\ %R
