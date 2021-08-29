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

local vterm = Terminal:new {
    direction = 'vertical',
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

function VtermToggle()
    vterm:toggle()
end

function LazygitToggle()
    lazygit:toggle()
end

local noremap = { noremap = true }
-- this is actually <C-/>; however, vim recognized it as <C-_>
map('n', '<C-_>', ':lua HtermToggle()<CR>', noremap)
map('n', '<C-\\>', ':lua VtermToggle()<CR>', noremap)
map('t', '<C-_>', '<C-\\><C-n>:lua HtermToggle()<CR>', noremap)
map('t', '<C-\\>', '<C-\\><C-n>:lua VtermToggle()<CR>', noremap)
map('n', '<leader>g', ':lua LazygitToggle()<CR>', { noremap = true, silent = true })
