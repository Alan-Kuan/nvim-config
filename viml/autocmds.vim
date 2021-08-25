augroup half_shiftwidth
    autocmd!
    autocmd filetype vue,scss,typescript,python set shiftwidth=2
    autocmd filetype vue,scss,typescript,python set tabstop=2
augroup END

" let template files of C++ be recognized as .cpp files
augroup filetype_tpp
    autocmd!
    autocmd BufNewFile,BufReadPost *.tpp set filetype=cpp
augroup END

" Turn off line numbers and start insert mode in terminal
augroup terminal_start
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber | startinsert
augroup END

" Switch to English input method when leave insert mode
augroup im_fallback
    autocmd!
    autocmd InsertLeave * if(executable('fcitx5-remote')) | call system('fcitx5-remote -s keyboard-us') | endif
augroup END

augroup compile_and_run
    autocmd!
    " Key bindings for compiling the current file
    autocmd filetype c nmap <F4> :w <bar> :Dispatch! gcc % -o %:r<CR>
    autocmd filetype cpp nmap <F4> :w <bar> :Dispatch! g++ % -o %:r<CR>
    autocmd filetype go nmap <F4> :w <bar> :Dispatch! go build %<CR>
    autocmd filetype markdown nmap <F4> :w <bar> :Dispatch! mdpdf %<CR>
    " Key bindings for (compiling and) running the current file
    autocmd filetype javascript,typescript nmap <F5> :w <bar> :Start echo 'Program starts running.' && node %<CR>
    autocmd filetype python nmap <F5> :w <bar> :Start echo 'Program starts running.' && python3 %<CR>
    autocmd filetype c nmap <F5> :w <bar> :Start gcc % -o %:r && echo 'Program starts running.' && ./%:r<CR>
    autocmd filetype cpp nmap <F5> :w <bar> :Start g++ % -o %:r && echo 'Program starts running.' && ./%:r<CR>
    autocmd filetype go nmap <F5> :w <bar> :Start echo 'Program starts running.' && go run %<CR>
    autocmd filetype markdown nmap <F5> :w <bar> :Dispatch! mdpdf % && xdg-open %:r.pdf<CR>
augroup END
