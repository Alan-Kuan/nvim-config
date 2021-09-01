local cmd = vim.cmd
local map = vim.api.nvim_set_keymap
local Terminal = require('toggleterm.terminal').Terminal

require('toggleterm').setup {
    size = function (term)
        if term.direction == "horizontal" then
            return 6
        elseif term.direction == "vertical" then
            return 50
        end
    end,
    hidden = true,
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

local lazygit = Terminal:new {
    cmd = 'lazygit',
    dir = 'git_dir',
    direction = 'float',
    hidden = true,
    float_opts = {
        border = 'curved',
        height = 30
    }
}

function HtermToggle()
    hterm:toggle()
end

function LazygitToggle()
    lazygit:toggle()
end

local option = { noremap = true, silent = true }
-- this is actually <C-/>; however, vim recognized it as <C-_>
map('n', '<C-_>', ':lua HtermToggle()<CR>', option)
map('t', '<C-_>', '<C-\\><C-n>:lua HtermToggle()<CR>', option)
map('n', '<leader>g', ':lua LazygitToggle()<CR>', option)

-- Key bindings for compiling the current file
cmd([[
augroup compile_files
    autocmd!
    autocmd filetype c nmap <F4> :w <bar> :TermExec cmd="gcc % -o %:r" direction="horizontal"<CR>
    autocmd filetype cpp nmap <F4> :w <bar> :TermExec cmd="g++ % -o %:r" direction="horizontal"<CR>
    autocmd filetype go nmap <F4> :w <bar> :TermExec cmd="go build %" direction="horizontal"<CR>
    autocmd filetype markdown nmap <F4> :w <bar> :TermExec cmd="mdpdf %" direction="horizontal"<CR>
augroup END
]])
-- Key bindings for (compiling and) running the current file
cmd([[
augroup run_files
    autocmd!
    autocmd filetype javascript nmap <F5> :w <bar> :TermExec cmd="node %"<CR>
    autocmd filetype typescript nmap <F5> :w <bar> :TermExec cmd="deno run %"<CR>
    autocmd filetype python nmap <F5> :w <bar> :TermExec cmd="python3 %"<CR>
    autocmd filetype c nmap <F5> :w <bar> :TermExec cmd="gcc % -o %:r && ./%:r"<CR>
    autocmd filetype cpp nmap <F5> :w <bar> :TermExec cmd="g++ % -o %:r && ./%:r"<CR>
    autocmd filetype go nmap <F5> :w <bar> :TermExec cmd="go run %"<CR>
    autocmd filetype markdown nmap <F5> :w <bar> :TermExec cmd="mdpdf % && xdg-open %:r.pdf" open=0<CR>
augroup END
]])
