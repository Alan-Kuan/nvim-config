local tree_cb = require('nvim-tree.config').nvim_tree_callback

local hotkey_list = {
    { key = { '<CR>', 'o', '<2-LeftMouse>' },   cb = tree_cb('edit') },
    { key = { '<S-CR>', 'x' },                  cb = tree_cb('close_node') },
    { key = 'S',                                cb = tree_cb('system_open') },
    { key = 'v',                                cb = tree_cb('vsplit') },
    { key = 'i',                                cb = tree_cb('split') },
    { key = 't',                                cb = tree_cb('tabnew') },
    { key = 'C',                                cb = tree_cb('cd') },
    { key = 'P',                                cb = tree_cb('parent_node') },
    { key = '<Tab>',                            cb = tree_cb('preview') },
    { key = 'K',                                cb = tree_cb('first_sibling') },
    { key = 'J',                                cb = tree_cb('last_sibling') },
    { key = 'I',                                cb = tree_cb('toggle_ignored') },
    { key = 'H',                                cb = tree_cb('toggle_dotfiles') },
    { key = 'R',                                cb = tree_cb('refresh') },
    { key = 'a',                                cb = tree_cb('create') },
    { key = 'd',                                cb = tree_cb('remove') },
    { key = 'r',                                cb = tree_cb('rename') },
    { key = '<C-r>',                            cb = tree_cb('full_rename') },
    { key = 'gp',                               cb = tree_cb('prev_git_item') },
    { key = 'gn',                               cb = tree_cb('next_git_item') },
    { key = 'q',                                cb = tree_cb('close') },
    { key = '?',                                cb = tree_cb('toggle_help') },
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
