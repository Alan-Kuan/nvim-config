require('neo-tree').setup {
    close_if_last_window = true,
    enable_git_status = true,
    enable_diagnostics = true,
    enable_modified_markers = true,
    enable_refresh_on_write = true,

    source_selector = {
        winbar = true,
    },

    default_component_configs = {
        icon = {
            folder_closed = ' ',
            folder_open = ' ',
            folder_empty = ' ',
            folder_empty_open = ' ',
        },
        modified = {
            symbol = '',
        },
        git_status = {
            symbols = {
                modified = '',
                renamed = '󰘎 ',
            }
        },
    },

    use_default_mappings = false,
    window = {
        mappings = {
            ['Z'] = 'expand_all_nodes',
            ['z'] = 'close_all_nodes',

            ['h'] = 'open_split',
            ['v'] = 'open_vsplit',
            ['t'] = 'open_tabnew',
            ['<2-LeftMouse>'] = 'open_with_window_picker',
            ['<cr>'] = 'open_with_window_picker',
            ['o'] = 'open_with_window_picker',
            ['c'] = 'close_node',

            ['<tab>'] = { 'toggle_preview', config = { use_float = true } },
            ['l'] = 'focus_preview',

            ['a'] = { 'add', config = { show_path = 'relative' } },
            ['d'] = 'delete',
            ['r'] = 'rename',
            ['y'] = 'copy_to_clipboard',
            ['x'] = 'cut_to_clipboard',
            ['p'] = 'paste_from_clipboard',

            ['R'] = 'refresh',
            ['q'] = 'close_window',
            ['<'] = 'prev_source',
            ['>'] = 'next_source',
            ['?'] = 'show_help',
        },
    },
    filesystem = {
        group_empty_dirs = true,
        window = {
            mappings = {
                ['H'] = 'toggle_hidden',
                ['/'] = 'filter_on_submit',
                ['f'] = 'filter_on_submit',
                ['F'] = 'clear_filter',
                ['D'] = 'fuzzy_finder_directory',
                ['<bs>'] = 'navigate_up',
                ['.'] = 'set_root',
                ['[g'] = 'prev_git_modified',
                [']g'] = 'next_git_modified',
            },
        },
    },
    git_status = {
        mappings = {
            ['A'] = 'git_add_all',
            ['ga'] = 'git_add_file',
            ['gu'] = 'git_unstage_file',
            ['gr'] = 'git_revert_file',
            ['gc'] = 'git_commit',
            ['gp'] = 'git_push',
        }
    },
}

vim.api.nvim_set_hl(0, 'NeoTreeGitConflict', { bold = true, fg = '#ff8700' })
vim.api.nvim_set_hl(0, 'NeoTreeGitUntracked', { fg = '#ff8700' })
