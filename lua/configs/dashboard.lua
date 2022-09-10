local db = require('dashboard')

db.custom_header = {
    '', '',
    [[   _  _                              _            ]],
    [[  | \| |    ___     ___    __ __    (_)    _ __   ]],
    [[  | .` |   / -_)   / _ \   \ V /    | |   | '  \  ]],
    [[  |_|\_|   \___|   \___/   _\_/_   _|_|_  |_|_|_| ]],
    [[ _|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""| ]],
    [[ "`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-' ]],
    '', '',
}

db.custom_center = {
    { icon = '  ', desc = 'New File                ', shortcut = '<leader>cn', action = 'DashboardNewFile' },
    { icon = '  ', desc = 'Bookmarks               ', shortcut = '<leader>fb', action = 'Telescope marks' },
    { icon = '  ', desc = 'Colorschemes            ', shortcut = '<leader>cc', action = 'Telescope colorscheme' },
    { icon = '  ', desc = 'Find File               ', shortcut = '<leader>ff', action = 'Telescope find_files' },
    { icon = '  ', desc = 'Find History            ', shortcut = '<leader>fh', action = 'Telescope oldfiles' },
    { icon = '  ', desc = 'Find Word               ', shortcut = '<leader>fg', action = 'Telescope live_grep' },
    { icon = '  ', desc = 'Last Session            ', shortcut = '<leader>sl', action = 'SessionLoad' },
    { icon = '  ', desc = 'Notifications           ', shortcut = '<leader>nc', action = 'Telescope notify' },
}

db.custom_footer = {
    '', '',
    ' Enjoy your day.'
}

vim.keymap.set('n', '<leader>ss', '<Cmd>SessionSave<CR>', { silent = true })
vim.keymap.set('n', '<leader>sl', '<Cmd>SessionLoad<CR>', { silent = true })
vim.keymap.set('n', '<leader>cn', '<Cmd>DashboardNewFile<CR>', { silent = true })

vim.cmd('hi DashboardHeader     guifg=#42ff7b')
vim.cmd('hi DashboardCenterIcon guifg=white')
vim.cmd('hi DashboardCenter     guifg=#42a1ff')
vim.cmd('hi DashboardShortCut   guifg=skyblue')
vim.cmd('hi DashboardFooter     guifg=#ffd062')
