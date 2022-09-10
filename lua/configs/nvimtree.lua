local hotkey_list = {
    { key = { '<CR>', 'o', '<2-LeftMouse>' },   action = 'edit' },
    { key = { '<S-CR>', 'x' },                  action = 'close_node' },
    { key = 'S',                                action = 'system_open' },
    { key = 'v',                                action = 'vsplit' },
    { key = 'i',                                action = 'split' },
    { key = 't',                                action = 'tabnew' },
    { key = 'C',                                action = 'cd' },
    { key = 'P',                                action = 'parent_node' },
    { key = '<Tab>',                            action = 'preview' },
    { key = 'K',                                action = 'first_sibling' },
    { key = 'J',                                action = 'last_sibling' },
    { key = 'I',                                action = 'toggle_ignored' },
    { key = 'H',                                action = 'toggle_dotfiles' },
    { key = 'R',                                action = 'refresh' },
    { key = 'a',                                action = 'create' },
    { key = 'd',                                action = 'remove' },
    { key = 'r',                                action = 'rename' },
    { key = '<C-r>',                            action = 'full_rename' },
    { key = 'gp',                               action = 'prev_git_item' },
    { key = 'gn',                               action = 'next_git_item' },
    { key = 'q',                                action = 'close' },
    { key = 'f',                                action = 'live_filter' },
    { key = 'F',                                action = 'clear_live_filter' },
    { key = '?',                                action = 'toggle_help' },
}

require('nvim-tree').setup {
    -- closes neovim automatically when the tree is the last **WINDOW** in the view
    -- auto_close = true,

    disable_netrw = true,
    hijack_netrw = true,
    hijack_directories = {
        enable = true,
        auto_open = true,
    },

    -- hijack the cursor in the tree to put it at the start of the filename
    hijack_cursor = true,

    filters = {
        dotfiles = true,
        custom = { '.git', 'node_modules' },
    },

    live_filter = {
        always_show_folders = false,
    },

    actions = {
        open_file = {
            quit_on_open = true,
            window_picker = {
                exclude = {
                    filetype = {
                        'Trouble',
                        'Outline',
                        'packer'
                    },
                    buftype = {
                        'terminal'
                    },
                }
            },
        },
    },

    renderer = {
        highlight_git = true,
        group_empty = true,
    },

    -- show lsp diagnostics in the signcolumn
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        }
    },

    view = {
        mappings = {
            -- custom only false will merge the list with the default mappings
            -- if true, it will only use your list to set the mappings
            custom_only = true,
            -- list of mappings to set on the tree manually
            list = hotkey_list
        }
    }
}
