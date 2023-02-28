require('window-picker').setup {
    autoselect_one = true,
    include_current = false,
    filter_rules = {
        -- ignore windows by buffer options
        bo = {
            filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
            buftype = { 'terminal', 'quickfix' },
        },
    },
    other_win_hl_color = 'skyblue',
}
