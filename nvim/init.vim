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
" use system clipboard
set clipboard+=unnamed
" make backspace work like most other programs
set backspace=indent,eol,start
" highlight column 80,120
set colorcolumn=80,120
" keep context on scrolling
set scrolloff=5
" don't show mode Airline deals with that
set noshowmode
" use 1 option for autocomplete
set completeopt+=noinsert
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

""""""""""""""
" Git gutter
""""""""""""""
let g:gitgutter_enabled=1
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
" Jump to first match by Enter or Space
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
" keep cursor column when JK motion
let g:EasyMotion_startofline=0
" use only keys from list
let g:EasyMotion_keys = 'asdfghjklqwertyuiopzxcvbnm'
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

" Run last macro with Q
nnoremap Q @@

" don't lose selection when indenting
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

" Common typo
nnoremap q: :q

" control is to far away
inoremap <C-e> <C-o>

" clear highlights on search
nnoremap \ :noh<CR>

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = " "

" insert line below cursor
nnoremap <leader>ij o<esc>
" insert line above cursor
nnoremap <leader>ik O<esc>

" copy buffer
nnoremap <leader>by ggVGy
" replace buffer with clipboard
nnoremap <leader>bp ggVGp

" easy navigate to all word beginigns in two directions
map <Leader>ss <Plug>(easymotion-bd-w)
" find in current line
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>h <Plug>(easymotion-linebackward)
" go to line even if numbers is not displayed
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

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
nnoremap <leader>b :Files ~/kb<cr>
nnoremap <leader>и :Files ~/kb<cr>

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
  autocmd BufNewFile,BufRead,BufEnter ~/kb/* call Load_kb_settings()
augroup END

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

function! Load_kb_settings()
  " allow to use gf for links
  setlocal suffixesadd=.md
  setlocal path+=~/kb

  " save buffer when typing
  autocmd KbGroup TextChanged,TextChangedI *.md silent write

  " allow to use Cyrillic chars
  setlocal langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

  " set spelling
  setlocal spell spelllang=uk,en

  " highlight spell error with red
  hi SpellBad cterm=underline ctermfg=009 guifg=#ff0000
  autocmd HighlightGroup ColorScheme * hi SpellBad cterm=underline ctermfg=009 guifg=#ff0000

  " find suggestion for word under cursor
  nnoremap <buffer> zf :call FzfSpell()<CR>
  nnoremap <buffer> яа :call FzfSpell()<CR>

  " create new note
  nnoremap <buffer> <leader>n :call New_note()<cr>
  nnoremap <buffer> <leader>т :call New_note()<cr>

  " open current file in obsidian
  nnoremap <buffer> <leader>o :silent !open 'obsidian://%:p'<cr>
  nnoremap <buffer> <leader>щ :silent !open 'obsidian://%:p'<cr>

  " open graph in obsidian
  nnoremap <buffer> <leader>g :silent !~/kb/scripts/graph.js<cr>
  nnoremap <buffer> <leader>п :silent !~/kb/scripts/graph.js<cr>

  " encrypt notes
  nnoremap <buffer> <leader>U :!~/kb/scripts/encrypt.py<cr>
  nnoremap <buffer> <leader>Г :!~/kb/scripts/encrypt.py<cr>

  " decrypt notes
  nnoremap <buffer> <leader>u :!~/kb/scripts/decrypt.py<cr>:e ~/kb/daily-notes/current-period.md<cr>
  nnoremap <buffer> <leader>г :!~kb/scripts/decrypt.py<cr>:e ~/kb/daily-notes/current-period.md<cr>

  " save current file commit and push changes
  nnoremap <buffer> <leader>p :Prettier<cr>:!~/kb/scripts/save.py<cr>
  nnoremap <buffer> <leader>з :Prettier<cr>:!~/kb/scripts/save.py<cr>

  " insert `## year-month-day` in the top of file and start typing
  nnoremap <buffer> <leader>d ggjo## <C-c>"=strftime("%Y-%m-%d")<cr>po<cr>
  nnoremap <buffer> <leader>в ggjo## <C-c>"=strftime("%Y-%m-%d")<cr>po<cr>

  " insert `- year-month-day - ` in the end of file and start typing
  nnoremap <buffer> <leader>h Go<esc>i- <C-c>"=strftime("%Y-%m-%d")<cr>pA -<space>
  nnoremap <buffer> <leader>р Go<esc>i- <C-c>"=strftime("%Y-%m-%d")<cr>pA -<space>

  " (i)nsert i(m)age
  nnoremap <buffer> <leader>im o![]()<esc>i
  nnoremap <buffer> <leader>шь o![]()<esc>i

  " insert h3 and start typing
  nnoremap <buffer> <leader>3 i###<space>
  " insert h4 and start typing
  nnoremap <buffer> <leader>4 i####<space>

  " insert line below cursor for Cyrillic
  nnoremap <buffer> <leader>що o<esc>
  " insert line above cursor for Cyrillic
  nnoremap <buffer> <leader>щл O<esc>

  " treat 'go to definition' as 'go to file' for [[note]]
  nnoremap <buffer> gd gf
  nnoremap <buffer> пв gf

  " move by line for long lines for Cyrillic
  nnoremap о gj
  nnoremap л gk

  " use prettier for w and q
  nnoremap <buffer> <leader>й :Prettier<cr>:q<cr>
  nnoremap <buffer> <leader>q :Prettier<cr>:q<cr>
  nnoremap <buffer> <leader>w :Prettier<cr>
  nnoremap <buffer> <leader>ц :Prettier<cr>
  " (s)earch (c)ommnad for Cyrillic
  nnoremap <buffer> <leader>іа :Files<CR>
  nnoremap <buffer> <leader>іи :Buffers<CR>
  nnoremap <buffer> <leader>ід :Lines<CR>
  nnoremap <buffer> <leader>іь :Marks<CR>
  nnoremap <buffer> <leader>ір :History<CR>
  nnoremap <buffer> <leader>іс :Commits<CR>
endfunction
