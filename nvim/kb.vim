""""""""""""""""""""
" knowledge base related mappings
""""""""""""""""""""

" quick open of kb
map <silent> <leader>k :FZF ~/kb<cr>
map <silent> <leader>л :FZF ~/kb<cr>

" open curent file in obsidian
map <leader>o :silent !open 'obsidian://%:p'<CR>
map <leader>щ :silent !open 'obsidian://%:p'<CR>

" open graph in obsidian
map <leader>g :silent !~/kb/scripts/graph.js<CR>
map <leader>п :silent !~/kb/scripts/graph.js<CR>

" encrypt notes
map <leader>l :!~/kb/scripts/encrypt.py<CR>
map <leader>д :!~/kb/scripts/encrypt.py<CR>

" decrypt notes
map <leader>u :!~/kb/scripts/decrypt.py<CR>
map <leader>г :!~kb/scripts/decrypt.py<CR>

" commit and push changes
map <leader>p :!~/kb/scripts/save.py<CR>
map <leader>з :!~/kb/scripts/save.py<CR>

" insert `## year-month-day` in the top of file and start typing
map <leader>dd ggjo## <C-c>"=strftime("%Y-%m-%d")<CR>po<CR>
map <leader>вв ggjo## <C-c>"=strftime("%Y-%m-%d")<CR>po<CR>

" insert `- year-month-day - ` in the end of file and start typing
map <leader>h Gi- <C-c>"=strftime("%Y-%m-%d")<CR>pA -<space>
map <leader>р Gi- <C-c>"=strftime("%Y-%m-%d")<CR>pA -<space>

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

map <leader>й :wq<CR>
map <leader>ц :w<CR>
map <leader>ь :Marks<CR>
map <leader>а :Files<CR>

