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
