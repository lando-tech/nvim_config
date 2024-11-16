# Neovim config
A simple Neovim config with a custom theme. The theme is still under development, but it is functional. The main branch is primarily for linux, but it may run on MacOs as well. There is a windows branch, but I haven't developed that yet.

## LSP
LSP:
1. Rust-Analyzer provides support for rust files. Can be installed with most package managers.
2. Pyright for Python support. Typically installed with npm, but you may be able to use a different package manager.
3. Lua-Language-Server: best to just clone the repo from LuaLS <"https://github.com/LuaLS/lua-language-server">.
4. Make sure you modify the path for whatever shell you are using. Neovim normally looks for the LSP servers in your shell's path.

# Custom nvim options
Options:
I have relative line numbers set, and some automatic tabs to spaces conversions, as well as code folding enabled. There is a lot to add here, my config is very minimal so feel free to add whatever you'd like.

## Custom Keybindings
Keybindings:
1. 'Leader("\\")'r sends Python script directly to repl and opens a repl inside of Neovim
2. Leader("\\")rl sends Lua script to the Lua-language-server
3. Trying to integrate a function to open Cargo and compile rust projects as well.
4. There are numerous other bindings for Nvim Tree and Autocomplete, just take a look at the comments inside of keybindings.lua.

## Custom Plugins
Plugins:
1. 'wbthomason/packer.nvim'
2. 'neovim/nvim-lspconfig'
3. 'nvim-lua/plenary.nvim'
4. 'L3MON4D3/LuaSnip'
5. 'terrortylor/nvim-comment'
6. 'rktjmp/lush.nvim'
7. 'nvim-treesitter/nvim-treesitter'
8. 'hrsh7th/nvim-cmp'
9. 'nvim-tree/nvim-tree.lua'

## Note
I am still adding more, but I try to keep it as minimal as possible. Feel free to fork it and add to it! I would love to see what other configs there are out there. Cheers!

## Maintainer
+ Aaron Newman
+ aaron.newman@landotech.io
