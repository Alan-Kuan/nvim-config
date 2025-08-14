return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    cmd = 'Neotree',
    keys = {
      { '-', '<Cmd>Neotree toggle source=last<CR>', desc = 'Toggle Neotree' },
    },
    opts = {
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
            added = ' 󰐕',
            modified = ' 󱈸',
            renamed = ' 󰘎 ',
            deleted = '  ',
          },
        },
      },

      renderers = {
        directory = {
          { 'indent' },
          { 'icon' },
          { 'current_filter' },
          {
            'container',
            content = {
              { 'name', zindex = 10 },
              { 'clipboard', zindex = 10 },
              {
                'git_status',
                zindex = 20,
                align = 'right',
                hide_when_expanded = true,
              },
              {
                'diagnostics',
                errors_only = true,
                zindex = 20,
                align = 'right',
                hide_when_expanded = true,
              },
            },
          },
        },
        file = {
          { 'indent' },
          { 'icon' },
          {
            'container',
            content = {
              { 'name', zindex = 10 },
              { 'clipboard', zindex = 10 },
              { 'bufnr', zindex = 10 },
              { 'modified', zindex = 20, align = 'right' },
              { 'diagnostics', zindex = 20, align = 'right' },
              { 'git_status', zindex = 20, align = 'right' },
            },
          },
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
          ['<CR>'] = 'open_with_window_picker',
          ['o'] = 'open_with_window_picker',
          ['c'] = 'close_node',

          ['<Tab>'] = { 'toggle_preview', config = { use_float = true, use_image_nvim = true } },
          ['l'] = 'focus_preview',

          ['a'] = { 'add', config = { show_path = 'relative' } },
          ['d'] = 'delete',
          ['r'] = 'rename',
          ['y'] = 'copy_to_clipboard',
          ['x'] = 'cut_to_clipboard',
          ['p'] = 'paste_from_clipboard',

          ['R'] = 'refresh',
          ['q'] = 'close_window',
          ['9'] = 'prev_source',
          ['0'] = 'next_source',
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
            ['<BS>'] = 'navigate_up',
            ['.'] = 'set_root',
            ['[g'] = 'prev_git_modified',
            [']g'] = 'next_git_modified',
          },
        },
      },
      git_status = {
        window = {
          mappings = {
            ['A'] = 'git_add_all',
            ['ga'] = 'git_add_file',
            ['gu'] = 'git_unstage_file',
            ['gr'] = 'git_revert_file',
            ['gc'] = 'git_commit',
            ['gp'] = 'git_push',
          },
        },
      },
    },
  },
}
