" enable syntax highlighting
syntax enable

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

" set light theme
set background=light

" disable keys to build new habits
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

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

" With a map leader it's possible to do extra key combinations
" " like <leader>w saves the current file
let mapleader = " "

" lazzy to type :command CR
map <leader>q :wq<CR>
map <leader>w :w<CR>

" https://vim.fandom.com/wiki/Make_search_results_appear_in_the_middle_of_the_screen
:nnoremap n nzz
:nnoremap N Nzz
:nnoremap * *zz
:nnoremap # #zz
:nnoremap g* g*zz
:nnoremap g# g#zz

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" clear highlights on search
nnoremap <CR> :noh<CR>

inoremap jk <ESC>
inoremap jj <ESC>

" load plugins
call plug#begin('$HOME/.vim/vim-plug')

Plug 'itchyny/lightline.vim'
Plug '/usr/local/opt/fzf'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-surround'
Plug 'machakann/vim-highlightedyank'
Plug 'luochen1990/rainbow'
Plug 'wakatime/vim-wakatime'

call plug#end()

"""""""""""""""
" Rainbow
"""""""""""""""
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle


""""""""""""""
" Git gutter
""""""""""""""
let g:gitgutter_enabled=0
nnoremap <silent> <leader>d :GitGutterToggle<cr>


"""""""""""""
" Lightline
"""""""""""""
" set settings for lightline.vim
set laststatus=2

" set filemane in pangel
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ }

set noshowmode

function! LightlineFilename()
      return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
              \ &filetype ==# 'unite' ? unite#get_status_string() :
              \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
              \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

""""""""""""""""
" NERDTRee
""""""""""""""""
" enable NEDRTRee by default
" autocmd vimenter * NERDTree
" how hidden files
let NERDTreeShowHidden=1

map <leader>e :NERDTreeToggle<CR>


"""""""""""""""""""""""
" vim-indent-guides
"""""""""""""""""""""""
map <leader>g :IndentGuidesToggle<CR>

let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_guide_size = 4
let g:indent_guides_color_change_percent = 3

