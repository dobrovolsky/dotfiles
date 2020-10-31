" load plugins
call plug#begin('$HOME/.vim/vim-plug')

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-surround'
Plug 'machakann/vim-highlightedyank'
Plug 'wakatime/vim-wakatime'
Plug 'joshdick/onedark.vim'
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'plasticboy/vim-markdown'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install'
  \ }

call plug#end()

""""""""""""""
" Git gutter
""""""""""""""
let g:gitgutter_enabled=0


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


"""""""""""""""""""""""
" vim-indent-guides
"""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_guide_size = 4
let g:indent_guides_color_change_percent = 3


"""""""""""""""""""""""
" deoplete
"""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1


"""""""""""""""""""""""
" vim-markdown
"""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1

