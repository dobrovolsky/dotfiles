" enable syntax highlighting
syntax on
" show line numbers
set number
set relativenumber

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show the matching part of the pair for [] {} and ()
set showmatch

" set onedark theme
colorscheme onedark
set termguicolors

" display incomplete commands
set showcmd

" highlight matches
set hlsearch

" incremental searching
set incsearch

" searches are case insensitive
set ignorecase

" use system clipboard
set clipboard+=unnamed

" make backspace work like most other programs
set backspace=indent,eol,start

" use 1 option for autocomplete
set completeopt+=noinsert

" prettier's doc says to add it
packloadall

