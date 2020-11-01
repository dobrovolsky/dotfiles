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

