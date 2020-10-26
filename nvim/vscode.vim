" knowledge base related mappings

function! RunTask(name)
    call VSCodeNotify('workbench.action.tasks.runTask', a:name)
endfunction

map <leader>o <Cmd>call RunTask('obsidian')<CR>
map <leader>щ <Cmd>call RunTask('obsidian')<CR>

map <leader>g <Cmd>call RunTask('graph')<CR>
map <leader>п <Cmd>call RunTask('graph')<CR>

map <leader>l <Cmd>call RunTask('encrypt')<CR>
map <leader>д <Cmd>call RunTask('encrypt')<CR>

map <leader>u <Cmd>call RunTask('decrypt')<CR>
map <leader>г <Cmd>call RunTask('decrypt')<CR>

map <leader>p <Cmd>call RunTask('push')<CR>
map <leader>з <Cmd>call RunTask('push')<CR>

" insert `## year-month-day` in the top of file and start typing
map <leader>d ggjo## <C-c>"=strftime("%Y-%m-%d")<CR>po<CR>
map <leader>в ggjo## <C-c>"=strftime("%Y-%m-%d")<CR>po<CR>

" insert `- year-month-day - ` in the end of file and start typing
map <leader>h Gi- <C-c>"=strftime("%Y-%m-%d")<CR>pA -<space>
map <leader>р Gi- <C-c>"=strftime("%Y-%m-%d")<CR>pA -<space>

" insert h3 and start typing
map <leader>3 i###<space>

map <leader>f <Cmd>call VSCodeNotify('editor.action.quickFix')<CR>
map <leader>а <Cmd>call VSCodeNotify('editor.action.quickFix')<CR>

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