" With a map leader it's possible to do extra key combinations
" " like <leader>w saves the current file
let mapleader = " "

" lazzy to type :command CR
map <leader>q :wq<CR>
map <leader>w :w<CR>
map <leader>r :register<CR>
map <leader>m :marks<CR>

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
