local g = vim.g

g.nvim_tree_ignore = { '.git', 'node_modules' }
g.nvim_tree_quit_on_open = 0
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_group_empty = 1
g.nvim_tree_lsp_diagnostics = 1

g.nvim_tree_disable_default_keybindings = 1

local tree_cb = require('nvim-tree.config').nvim_tree_callback

g.nvim_tree_bindings = {
    { key = {'<CR>', 'o', '<2-LeftMouse>'},     cb = tree_cb('edit') },
    { key = {'<S-CR>', 'x', '<2-RightMouse'},   cb = tree_cb('close_node') },
    { key = 'S',                                cb = tree_cb('system_open') },
    { key = 's',                                cb = tree_cb('vsplit') },
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
