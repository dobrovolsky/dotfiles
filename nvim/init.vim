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
" visual stuff
Plug 'vim-airline/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'machakann/vim-highlightedyank'
Plug 'junegunn/goyo.vim'
Plug 'morhetz/gruvbox'
Plug 'psliwka/vim-smoothie'
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
  \ 'do': 'yarn install'
  \ }
" better file navigation
Plug 'easymotion/vim-easymotion'
" easier word surrounding
Plug 'tpope/vim-surround'
" better navigation with netrw
Plug 'tpope/vim-vinegar'
" git support
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" navidate undo history
Plug 'mbbill/undotree'

call plug#end()

"""""""""""""""""""""""
" CONFIG
"""""""""""""""""""""""
" enable syntax highlighting
syntax on
" show line numbers
set number
set relativenumber
" set tabs to have 2 spaces
set ts=2
" indent when moving to the next line while writing code
set autoindent
" expand tabs into spaces
set expandtab
" when using the >> or << commands, shift lines by 2 spaces
set shiftwidth=2
" show the matching part of the pair for [] {} and ()
set showmatch
" set 24-bit RGB color
set termguicolors
colorscheme gruvbox
" display incomplete commands
set showcmd
" highlight matches
set hlsearch
" incremental searching
set incsearch
" searches are case insensitive
set ignorecase
" searches are case sensative only when term has at least one capital
set smartcase
" allow to navigate edited buffers without saving, just keep them in background
set hidden
" use system clipboard
set clipboard+=unnamed
" make backspace work like most other programs
set backspace=indent,eol,start
" highlight column 80,120
set colorcolumn=80,120
" keep context on scrolling
set scrolloff=5
" get more time to press keybinding
set timeoutlen=1500
" don't show mode Airline deals with that
set noshowmode
" use 1 option for autocomplete
set completeopt+=noinsert
" save undo trees in files
set undofile
" number of undo saved
set undolevels=10000
" prettier's doc says to add it
packloadall

" highlight spaces in the end of line
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

augroup HighlightGroup
  autocmd!
  autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()
augroup END

" always use global interpreter, usually virtualenv doesn't contain pynvim lib
let g:python3_host_prog = '~/.pyenv/shims/python'

""""""""""""""
" Git gutter
""""""""""""""
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
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
" Jump to first match by Enter or Space
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
" keep cursor column when JK motion
let g:EasyMotion_startofline=0
" use only keys from list
" let g:EasyMotion_keys='asdfghjklqwertyuiopzxcvbnm' " is set in KbGroup
"""""""""""""""""""""""
" vim-airline
"""""""""""""""""""""""
" make airline minimal
let g:airline_section_a = airline#section#create(['mode'])
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = ''
let g:airline_section_error = ''
let g:airline_section_warning = ''
"""""""""""""""""""""""
" undotree
"""""""""""""""""""""""
let g:undotree_SetFocusWhenToggle = 1
"""""""""""""""""""""""
" goyo
"""""""""""""""""""""""
function! s:goyo_enter()
  set number
  set relativenumber
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
"""""""""""""""""""""""
" vim-prettier
"""""""""""""""""""""""
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'all'
"""""""""""""""""""""""
" MAPPINGS
"""""""""""""""""""""""
" https://vim.fandom.com/wiki/Make_search_results_appear_in_the_middle_of_the_screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap G Gzz

" copy from cursor to end of line
nnoremap Y y$

" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" move by line for long lines
nnoremap j gj
nnoremap k gk

" run last macro with Q
nnoremap Q @@

" don't lose selection when indenting
vnoremap < <gv
vnoremap > >gv

" common typo
nnoremap q: :q

" clear highlights on search
nnoremap \ :noh<CR>

let mapleader = " "

" insert line below cursor
nnoremap <leader>ij o<esc>
" insert line above cursor
nnoremap <leader>ik O<esc>

" copy buffer
nnoremap <leader>by ggVGy
" replace buffer with clipboard
nnoremap <leader>bp ggVGp
" clear buffer
nnoremap <leader>bc ggVGd

" replace current word last stored in register
nnoremap <leader>rw viwp

" delete without storing in register
noremap <leader>dd "_dd

" easy navigate to all word beginigns in two directions
map <Leader>ss <Plug>(easymotion-bd-w)
" find in current line
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>h <Plug>(easymotion-linebackward)
" go to line even if numbers is not displayed
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" move to next/previos changed line with git
nmap ]d <Plug>(GitGutterNextHunk)
nmap [d <Plug>(GitGutterPrevHunk)

" move to next/previos method
nmap ]f ]m
nmap [f [m

" jump betwen 2 last buffers
nnoremap <leader><leader> <c-^>

" lazzy to type :command CR
nnoremap <leader>q :wq<CR>
nnoremap <leader>w :w<CR>
" (s)earch (c)ommnad
nnoremap <leader>sf :Files<CR>
nnoremap <leader>sb :Buffers<CR>
nnoremap <leader>sl :Lines<CR>
nnoremap <leader>sm :Marks<CR>
nnoremap <leader>sh :History<CR>
nnoremap <leader>sc :Commits<CR>
nnoremap <leader>sr :Rg<CR>
" (t)oggle (d)iff
nnoremap <leader>td :GitGutterToggle<cr>
" (t)oggle (u)undo
nnoremap <leader>tu :UndotreeToggle<cr>
" (t)oggle distraction (f)ree
nnoremap <leader>tf :Goyo<cr>

" open vim config file
nnoremap <leader>ev :e $MYVIMRC<cr>
" load vim config file
nnoremap <leader>es :source $MYVIMRC<cr>:nohl<cr>

" quick open of kb
nnoremap <leader>bb <cr>:Files ~/kb<cr>
nmap <leader>ии <leader>bb

" quick open of kb
nnoremap <leader>u :call Open_daily_note()<cr>
nmap <leader>г <leader>u

" allow using tab for completion
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" follow system theme mode
" https://stefan.sofa-rockers.org/2018/10/23/macos-dark-mode-terminal-vim/
function! SetBackgroundMode(...)
    let s:new_bg = "light"
    let s:mode = systemlist("defaults read -g AppleInterfaceStyle")[0]
    if s:mode ==? "dark"
        let s:new_bg = "dark"
    else
        let s:new_bg = "light"
    endif
    if &background !=? s:new_bg
      let &background = s:new_bg
    endif
endfunction
call SetBackgroundMode()
call timer_start(3000, "SetBackgroundMode", {"repeat": -1})

"""""""""""""""""""""""
" Knowledge Base
"""""""""""""""""""""""
" load some part only for kb
augroup KbGroup
  autocmd!
  autocmd BufNewFile,BufRead,BufEnter ~/kb/*.md call Load_kb_settings()
  " Should reset Cyrillic keys to english on buffer change to keep English
  " for not *md files, but for *md in kb will be set Cyrillic keys
  autocmd BufEnter * let g:EasyMotion_keys='asdfghjklqwertyuiopzxcvbnm'
augroup END

function! Load_kb_settings()
  " allow to use gf for links
  setlocal suffixesadd=.md
  setlocal path+=~/kb

  " set spelling
  setlocal spell spelllang=uk,en

  " highlight spell error with red
  hi SpellBad cterm=underline ctermfg=009 guifg=#ff0000
  autocmd HighlightGroup ColorScheme * hi SpellBad cterm=underline ctermfg=009 guifg=#ff0000

  " find suggestion for word under cursor
  nnoremap <buffer> zf :call FzfSpell()<CR>
  " create new note
  nnoremap <buffer> <leader>n :call New_note()<cr>
  " open current file in obsidian
  nnoremap <buffer> <leader>o :silent !open 'obsidian://%:p'<cr>
  " open graph in obsidian
  nnoremap <buffer> <leader>g :silent !~/kb/scripts/graph.js<cr>
  " encrypt notes
  nnoremap <buffer> <leader>U :!~/kb/scripts/encrypt.py<cr>
  " save current file commit and push changes
  nmap <buffer> <leader>p !~/kb/scripts/save.py<cr>
  " insert `## year-month-day` in the top of file and start typing
  nnoremap <buffer> <leader>d ggjo## <C-c>"=strftime("%Y-%m-%d")<cr>po<cr>
  " insert `- year-month-day - ` in the end of file and start typing
  nnoremap <buffer> <leader>ih Go<esc>i- <C-c>"=strftime("%Y-%m-%d")<cr>pA -<space>
  " (i)nsert i(m)age
  nnoremap <buffer> <leader>im o![]()<esc>hp
  " insert h3 and start typing
  nnoremap <buffer> <leader>3 i###<space>
  " insert h4 and start typing
  nnoremap <buffer> <leader>4 i####<space>
  " treat 'go to definition' as 'go to file' for [[note]]
  nnoremap <buffer> gd gf
  " use prettier for w and q
  nnoremap <buffer> <leader>q :Prettier<cr>:wq<cr>
  nnoremap <buffer> <leader>w :Prettier<cr>:w<cr>

  " allow to use Cyrillic chars
  setlocal langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
  autocmd KbGroup BufEnter *.md let g:EasyMotion_keys = 'фівапролдйцукенгшщзячсмить'

  " allow to use Cyrillic some for keybinding
  nmap <buffer> яа zf
  nmap <buffer> о j
  nmap <buffer> л k
  nmap <buffer> пв gd
  nmap <buffer> ]і ]s
  nmap <buffer> [і [s

  nmap <buffer> <leader>т <leader>n
  nmap <buffer> <leader>щ <leader>o
  nmap <buffer> <leader>п <leader>g
  nmap <buffer> <leader>Г <leader>U
  nmap <buffer> <leader>г <leader>u
  nmap <buffer> <leader>з <leader>p
  nmap <buffer> <leader>в <leader>d
  nmap <buffer> <leader>шь <leader>im
  nmap <buffer> <leader>шр <leader>ih

  nmap <buffer> <leader>шо <leader>ij
  nmap <buffer> <leader>шл <leader>ik

  map <buffer> <Leader>іі <leader>ss
  map <buffer> <Leader>д <leader>l
  map <buffer> <Leader>р <leader>h
  map <buffer> <Leader>о <leader>j
  map <buffer> <Leader>л <leader>k

  nmap <buffer> <leader>ц <leader>w
  nmap <buffer> <leader>й <leader>q

  nmap <buffer> <leader>іа <leader>sf
  nmap <buffer> <leader>іи <leader>sb
  nmap <buffer> <leader>ід <leader>sl
  nmap <buffer> <leader>іь <leader>sm
  nmap <buffer> <leader>ір <leader>sh
  nmap <buffer> <leader>іс <leader>sc
endfunction

" https://coreyja.com/vim-spelling-suggestions-fzf/
function! FzfSpellSink(word)
  exe 'normal! "_ciw'.a:word
endfunction

function! FzfSpell()
  let suggestions = spellsuggest(expand("<cword>"))
  return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'window': {'width': 0.5, 'height': 0.5} })
endfunction

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

" decrypt and open daily note in kb
function! Open_daily_note()
  exec "silent :!~/kb/scripts/decrypt.py"
  exec "e ~/kb/daily-notes/current-period.md"
endfunction
