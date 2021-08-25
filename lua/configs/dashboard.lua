local g = vim.g
local map = vim.api.nvim_set_keymap

g.dashboard_default_executive = 'telescope'

g.dashboard_custom_shortcut = {
    book_marks         = '\\fb',
    change_colorscheme = '\\tc',
    find_file          = '\\ff',
    find_history       = '\\fH',
    find_word          = '\\fg',
    last_session       = '\\sl',
    new_file           = '\\cn'
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
