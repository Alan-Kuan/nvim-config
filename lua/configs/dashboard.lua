local g = vim.g
local map = vim.api.nvim_set_keymap

g.dashboard_default_executive = 'telescope'

g.dashboard_custom_shortcut = {
    book_marks         = '<leader>fb',
    change_colorscheme = '<leader>tc',
    find_file          = '<leader>ff',
    find_history       = '<leader>fH',
    find_word          = '<leader>fg',
    last_session       = '<leader>sl',
    new_file           = '<leader>cn'
}

local silent = { silent = true }
map('n', '<leader>ss', ':<C-u>SessionSave<CR>', silent)
map('n', '<leader>sl', ':<C-u>SessionLoad<CR>', silent)
map('n', '<leader>cn', ':enew<CR>', silent)

g.dashboard_custom_header = {
    [[   _  _                              _            ]],
    [[  | \| |    ___     ___    __ __    (_)    _ __   ]],
    [[  | .` |   / -_)   / _ \   \ V /    | |   | '  \  ]],
    [[  |_|\_|   \___|   \___/   _\_/_   _|_|_  |_|_|_| ]],
    [[ _|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""| ]],
    [[ "`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-' ]]
}

g.dashboard_custom_footer = { ' Enjoy your day.' }
