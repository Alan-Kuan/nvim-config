nnoremap <space> <nop>
let mapleader = ' '

" clear search buffer
nnoremap <silent><C-n> :let @/=""<CR>

" for jumping between split screen to be easier
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-l> <C-\><C-n><C-w>l
" resize split
nnoremap <M-j> <C-w>+
nnoremap <M-k> <C-w>-
nnoremap <M-h> <C-w><
nnoremap <M-l> <C-w>>

" move lines
nnoremap <C-S-j> :m .+1<CR>==
nnoremap <C-S-k> :m .-2<CR>==
vnoremap <C-S-j> :m '>+1<CR>gv=gv
vnoremap <C-S-k> :m '<-2<CR>gv=gv

" select all
nnoremap <silent><leader>a  ggVG
" copy to the system clipboard
nnoremap <silent><leader>yy "+yy
vnoremap <silent><leader>y  "+y
" cut to the system clipboard
nnoremap <silent><leader>x  "+x
vnoremap <silent><leader>x  "+x
nnoremap <silent><leader>dd "+dd
vnoremap <silent><leader>d  "+d
nnoremap <silent><leader>D  "+D
vnoremap <silent><leader>D  "+D
" paste from the system clipboard
nnoremap <silent><leader>p  "+p
vnoremap <silent><leader>p  "+p
nnoremap <silent><leader>P  "+P
vnoremap <silent><leader>P  "+P
