local g = vim.g
local tree_cb = require('nvim-tree.config').nvim_tree_callback

g.nvim_tree_ignore = { '.git', 'node_modules' }
g.nvim_tree_quit_on_open = 1
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_group_empty = 1
g.nvim_tree_window_picker_exclude = {
    filetype = {
        'Trouble',
        'Outline',
        'packer'
    },
    buftype = {
        'terminal'
    }
}

local list = {
    { key = {'<CR>', 'o', '<2-LeftMouse>'},     cb = tree_cb('edit') },
    { key = {'<S-CR>', 'x', '<2-RightMouse'},   cb = tree_cb('close_node') },
    { key = 'S',                                cb = tree_cb('system_open') },
    { key = 'v',                                cb = tree_cb('vsplit') },
    { key = 'h',                                cb = tree_cb('split') },
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
    auto_close = true,
    -- hijacks new directory buffers when they are opened.
    update_to_buf_dir = {
        -- enable the feature
        enable = true,
        -- allow to open the tree if it was previously closed
        auto_open = true,
    },
    -- hijack the cursor in the tree to put it at the start of the filename
    hijack_cursor = true,
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
            list = list
        }
    }
}
