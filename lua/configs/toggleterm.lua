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
    open_mapping = '<C-p>',
    direction = 'float',
    float_opts = {
        border = 'curved'
    }
}

local noremap = { noremap = true }
-- this is actually <C-/>; however, vim recognized it as <C-_>
map('n', '<C-_>', ':ToggleTerm direction=horizontal<CR>', noremap)
map('n', '<C-\\>', ':ToggleTerm direction=vertical<CR>', noremap)

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
function LazygitToggle()
    lazygit:toggle()
end

map('n', '<leader>g', ':lua LazygitToggle()<CR>', { noremap = true, silent = true })
