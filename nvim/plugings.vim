" load plugins
call plug#begin('$HOME/.vim/vim-plug')

" fuzzy search
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" explore register
Plug 'junegunn/vim-peekaboo'

" file explorer
Plug 'scrooloose/nerdtree'

" visual stuff
Plug 'itchyny/lightline.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'machakann/vim-highlightedyank'
Plug 'junegunn/goyo.vim'
Plug 'joshdick/onedark.vim'

" better start screen
Plug 'mhinz/vim-startify'

" collect coding stats
Plug 'wakatime/vim-wakatime'

" code completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" markdown support
Plug 'plasticboy/vim-markdown'

" file prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install'
  \ }

" better file navigation
Plug 'easymotion/vim-easymotion'

" easier word surrounding
Plug 'tpope/vim-surround'

" git support
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

""""""""""""""
" Git gutter
""""""""""""""
let g:gitgutter_enabled=1


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
let g:indent_guides_enable_on_vim_startup = 1
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


"""""""""""""""""""""""
" vim-easymotion
"""""""""""""""""""""""
" Disable default mappings
let g:EasyMotion_do_mapping = 0

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

