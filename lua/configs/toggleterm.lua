local cmd = vim.cmd
local map = vim.api.nvim_set_keymap
local Terminal = require('toggleterm.terminal').Terminal

require('toggleterm').setup {
    size = function (term)
        if term.direction == "horizontal" then
            return 10
        elseif term.direction == "vertical" then
            return 50
        end
    end,
    open_mapping = '<C-p>',
    direction = 'float',
    float_opts = {
        border = 'curved'
    }
}

local hterm = Terminal:new {
    direction = 'horizontal',
    hidden = true
}

function HtermToggle()
    hterm:toggle()
end

local option = { noremap = true, silent = true }
-- this is actually <C-/>; however, vim recognized it as <C-_>
map('n', '<C-_>', ':lua HtermToggle()<CR>', option)
map('t', '<C-_>', '<C-\\><C-n>:lua HtermToggle()<CR>', option)

-- Key bindings for (compiling and) running the current file
cmd([[
augroup run_files
    autocmd!
    autocmd filetype javascript nmap <F5> :w <bar> :TermExec cmd='node "%:p:."'<CR>
    autocmd filetype typescript nmap <F5> :w <bar> :TermExec cmd='deno run "%:p:."'<CR>
    autocmd filetype python nmap <F5> :w <bar> :TermExec cmd='python3 "%:p:."'<CR>
    autocmd filetype c nmap <F5> :w <bar> :TermExec cmd='gcc "%:p:." -o "%:p:.:r" && "./%:p:.:r"'<CR>
    autocmd filetype cpp nmap <F5> :w <bar> :TermExec cmd='g++ "%:p:." -o "%:p:.:r" && "./%:p:.:r"'<CR>
    autocmd filetype go nmap <F5> :w <bar> :TermExec cmd='go run "%:p:."'<CR>
    autocmd filetype markdown nmap <F5> :w <bar> :TermExec cmd='mdpdf "%:p:." && xdg-open "%:p:.:r.pdf"' open=0<CR>
augroup END
]])
