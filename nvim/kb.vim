""""""""""""""""""""
" knowledge base related mappings
""""""""""""""""""""

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
  
  map <leader>й :Prettier<cr>:q<cr>
  map <leader>q :Prettier<cr>:q<cr>
  map <leader>ц :Prettier<cr>
  map <leader>w :Prettier<cr>
  map <leader>ь :Marks<cr>
  map <leader>а :Files<cr>
endfunction
