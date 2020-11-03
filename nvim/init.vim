"""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""
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
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'right': [['lineinfo'], ['filetype'], ['gitbranch']]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'gitbranch': 'FugitiveHead'
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


"""""""""""""""""""""""
" CONFIG
"""""""""""""""""""""""
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


"""""""""""""""""""""""
" MAPPINGS
"""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
" " like <leader>w saves the current file
let mapleader = " "

" lazzy to type :command CR
map <leader>q :wq<CR>
map <leader>w :w<CR>
map <leader>m :Marks<CR>
map <leader>f :Files<CR>
map <leader>b :Buffers<CR>

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

" show NERDTree
map <leader>e :NERDTreeToggle<CR>

" show git info
map <silent> <leader>d :GitGutterToggle<cr>

" allow using tab for completion
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
map <Leader>s <Plug>(easymotion-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
map <Leader>s <Plug>(easymotion-f2)


"""""""""""""""""""""""
" Knowledge Base
"""""""""""""""""""""""
" load some part only for kb
autocmd BufNewFile,BufRead,BufEnter ~/kb/* call Load_kb_settings()

" slugify note for filename
function! Sluggify(text)
  let l:trimmed_line = substitute(a:text, '^#* ', '', '')
  let l:lowered_line = tolower(l:trimmed_line)
  let l:sanitized_line = substitute(l:lowered_line, '[^a-z0-9 ]', '', 'g')
  let l:dashed_line = substitute(l:sanitized_line, ' ', '-', 'g')
  let l:slugged_line = substitute(l:dashed_line, '--*', '-', 'g')
  return l:slugged_line
endfunction

" create new md file in kb or open existing
function! New_note()
  let l:name = input("Note name: ")
  let l:fname = "~/kb/" . Sluggify(l:name) . ".md"
  exec "e " . l:fname
  " insert template only for new files
  if empty(expand(glob(l:fname)))
    exec "normal gg0i# " . l:name . "\<cr>\<cr>## References\<cr>\<cr>## Links\<cr>\<cr>## Notes\<cr>\<cr>\<esc>"
  endif
endfunction

" quick open of kb
map <silent> <leader>k :Files ~/kb<cr>
map <silent> <leader>л :Files ~/kb<cr>

map <silent> <leader>n :call New_note()<cr>
map <silent> <leader>т :call New_note()<cr>

function! Load_kb_settings()
  " allow to use gf for links
  set suffixesadd=.md
  set path+=~/kb

  " don't try to save NERDTree buffer
  autocmd TextChanged,TextChangedI *
    \ if &buftype ==# '' || &buftype == 'acwrite' |
    \     silent write |
    \ endif
  
  " open curent file in obsidian
  map <leader>o :silent !open 'obsidian://%:p'<cr>
  map <leader>щ :silent !open 'obsidian://%:p'<cr>
  
  " open graph in obsidian
  map <leader>g :silent !~/kb/scripts/graph.js<cr>
  map <leader>п :silent !~/kb/scripts/graph.js<cr>
  
  " encrypt notes
  map <leader>l :!~/kb/scripts/encrypt.py<cr>
  map <leader>д :!~/kb/scripts/encrypt.py<cr>
  
  " decrypt notes
  map <leader>u :!~/kb/scripts/decrypt.py<cr>:e ~/kb/daily-notes/current-period.md<cr>
  map <leader>г :!~kb/scripts/decrypt.py<cr>:e ~/kb/daily-notes/current-period.md<cr>
  
  " commit and push changes
  map <leader>p :!~/kb/scripts/save.py<cr>
  map <leader>з :!~/kb/scripts/save.py<cr>
  
  " insert `## year-month-day` in the top of file and start typing
  map <leader>dd ggjo## <C-c>"=strftime("%Y-%m-%d")<cr>po<cr>
  map <leader>вв ggjo## <C-c>"=strftime("%Y-%m-%d")<cr>po<cr>
  
  " insert `- year-month-day - ` in the end of file and start typing
  map <leader>h Gi- <C-c>"=strftime("%Y-%m-%d")<cr>pA -<space>
  map <leader>р Gi- <C-c>"=strftime("%Y-%m-%d")<cr>pA -<space>
  
  " insert h3 and start typing
  map <leader>3 i###<space>
  
  " allow to use cyrillic chars
  set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
  
  nmap Ж :
  " yank
  nmap Н Y
  nmap з p
  nmap ф a
  nmap щ o
  nmap г u
  nmap З P
 
  " set spelling
  set spell spelllang=uk,en

  " https://coreyja.com/vim-spelling-suggestions-fzf/
  function! FzfSpellSink(word)
    exe 'normal! "_ciw'.a:word
  endfunction

  function! FzfSpell()
    let suggestions = spellsuggest(expand("<cword>"))
    return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'window': {'width': 0.5, 'height': 0.5} })
  endfunction

  nnoremap z= :call FzfSpell()<CR>
  nnoremap я= :call FzfSpell()<CR>
  
  map <leader>й :Prettier<cr>:q<cr>
  map <leader>q :Prettier<cr>:q<cr>
  map <leader>ц :Prettier<cr>
  map <leader>w :Prettier<cr>
  map <leader>ь :Marks<cr>
  map <leader>а :Files<cr>
endfunction
