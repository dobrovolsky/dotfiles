" enable syntax highlighting
syntax enable

" show line numbers
set number

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

" enable all Python syntax highlighting features
let python_highlight_all = 1

" load plugins
call plug#begin()

Plug 'itchyny/lightline.vim'
Plug '/usr/local/opt/fzf'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-surround'

call plug#end()

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

" enable NEDRTRee by default
" autocmd vimenter * NERDTree
" how hidden files
let NERDTreeShowHidden=1

colorscheme default
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1
