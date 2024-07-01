return {
  {
    'goolord/alpha-nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = 'VimEnter',
    opts = function()
      local dashboard = require('alpha.themes.dashboard')

      -- Content
      dashboard.section.header.val = {
        [[   _  _                              _            ]],
        [[  | \| |    ___     ___    __ __    (_)    _ __   ]],
        [[  | .` |   / -_)   / _ \   \ V /    | |   | '  \  ]],
        [[  |_|\_|   \___|   \___/   _\_/_   _|_|_  |_|_|_| ]],
        [[ _|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""| ]],
        [[ "`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-' ]],
      }
      -- stylua: ignore
      dashboard.section.buttons.val = {
        dashboard.button('N', ' ' .. ' New File',      '<Cmd>enew <Bar> startinsert<CR>'),
        dashboard.button('b', ' ' .. ' Bookmarks',     '<Cmd>Telescope marks<CR>'),
        dashboard.button('f', ' ' .. ' Find File',     '<Cmd>Telescope find_files<CR>'),
        dashboard.button('r', ' ' .. ' Recent Files',  '<Cmd>Telescope oldfiles<CR>'),
        dashboard.button('g', ' ' .. ' Find text',     '<Cmd>Telescope live_grep<CR>'),
        dashboard.button('n', ' ' .. ' Notifications', '<Cmd>Telescope notify<CR>'),
        dashboard.button('c', ' ' .. ' Colorschemes',  '<Cmd>Telescope colorscheme<CR>'),
        dashboard.button('m', '󰢛 ' .. ' Mason',         '<Cmd>Mason<CR>'),
        dashboard.button('l', '󰒲 ' .. ' Lazy',          '<Cmd>Lazy<CR>'),
        dashboard.button('q', ' ' .. ' Quit',          '<Cmd>qa<CR>'),
      }
      dashboard.section.footer.val = {
        '',
        '',
        ' Enjoy your day.',
      }

      -- Highlightings
      dashboard.section.header.opts.hl = 'AlphaHeader'

      local icon_highlights = {
        'AlphaIcon',
        'AlphaBookmarkIcon',
        'AlphaIcon',
        'AlphaClockIcon',
        'AlphaWordIcon',
        'AlphaBellIcon',
        'AlphaPaletteIcon',
        'AlphaAnvilIcon',
        'AlphaSleepIcon',
        'AlphaIcon',
      }
      for idx, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = icon_highlights[idx]
        button.opts.hl_shortcut = 'AlphaShortcut'
      end

      dashboard.section.footer.opts.hl = 'AlphaFooter'

      return dashboard
    end,
    config = function(_, dashboard)
      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == 'lazy' then
        vim.cmd.close()
        vim.api.nvim_create_autocmd('User', {
          pattern = 'AlphaReady',
          callback = function()
            require('lazy').show()
          end,
        })
      end

      require('alpha').setup(dashboard.opts)

      -- stylua: ignore start
      -- Main Colors
      vim.api.nvim_set_hl(0, 'AlphaHeader',   { fg = '#42ff7b' })
      vim.api.nvim_set_hl(0, 'AlphaShortcut', { fg = '#ffc0cb' })
      vim.api.nvim_set_hl(0, 'AlphaFooter',   { fg = '#ffd062' })

      -- Icon Colors
      vim.api.nvim_set_hl(0, 'AlphaIcon',         { fg = '#ffffff' })
      vim.api.nvim_set_hl(0, 'AlphaBookmarkIcon', { fg = '#ee8438' })
      vim.api.nvim_set_hl(0, 'AlphaClockIcon',    { fg = '#b3ee8f' })
      vim.api.nvim_set_hl(0, 'AlphaWordIcon',     { fg = '#34b5d9' })
      vim.api.nvim_set_hl(0, 'AlphaBellIcon',     { fg = '#ffee30' })
      vim.api.nvim_set_hl(0, 'AlphaPaletteIcon',  { fg = '#c7ae84' })
      vim.api.nvim_set_hl(0, 'AlphaAnvilIcon',    { fg = '#bbbbbb' })
      vim.api.nvim_set_hl(0, 'AlphaSleepIcon',    { fg = '#5a85cc' })
      -- stylua: ignore end
    end,
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = 'VeryLazy',
    keys = {
      { 'gb', '<Cmd>BufferLineCycleNext<CR>', desc = 'Go to next buffer' },
      { 'gB', '<Cmd>BufferLineCyclePrev<CR>', desc = 'Go to previous buffer' },
    },
    opts = {
      options = {
        indicator = {
          style = 'underline',
        },
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function (count, level, _, _)
          local icon = level:match('error') and ' ' or ' '
          return ' ' .. icon .. count
        end,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Explorer',
            text_align = 'center',
            separator = true,
          },
          {
            filetype = 'DiffviewFiles',
            text = 'Git Status',
            text_align = 'center',
            separator = true,
          },
        },
      },
      highlights = {
        indicator_selected = {
          sp = { attribute = 'fg', highlight = 'CursorLineNr' },
        },
        buffer_selected = {
          sp = { attribute = 'fg', highlight = 'CursorLineNr' },
          italic = false,
        },
        error_selected = {
          sp = { attribute = 'fg', highlight = 'CursorLineNr' },
          italic = false,
        },
        warning_selected = {
          sp = { attribute = 'fg', highlight = 'CursorLineNr' },
          italic = false,
        },
        warning_diagnostic_selected = {
          sp = { attribute = 'fg', highlight = 'CursorLineNr' },
        },
        error_diagnostic_selected = {
          sp = { attribute = 'fg', highlight = 'CursorLineNr' },
        },
        modified_selected = {
          sp = { attribute = 'fg', highlight = 'CursorLineNr' },
        },
        close_button_selected = {
          sp = { attribute = 'fg', highlight = 'CursorLineNr' },
        },
      },
    },
  },
  {
    'b0o/incline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = 'VeryLazy',
    config = function()
      local helpers = require('incline.helpers')
      local devicons = require('nvim-web-devicons')

      require('incline').setup({
        window = {
          padding = 0,
          margin = { horizontal = 0 },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
          if filename == '' then
            filename = '[No Name]'
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          return {
            ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or '',
            ' ',
            { filename, gui = modified and 'bold,italic' or 'bold' },
            ' ',
            guibg = '#44406e',
          }
        end,
      })
    end
  },
  {
    'hoob3rt/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = 'VeryLazy',
    opts = {
      options = {
        disabled_filetypes = { 'help', 'qf', 'Trouble' },
        component_separators = { left = '/', right = '/' },
        section_separators = { left = '', right = '' },
      },
      extensions = { 'neo-tree', 'toggleterm' },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          'branch',
          {
            'diff',
            symbols = {
              added = '',
              modified = ' ',
              removed = '',
            },
          },
        },
        lualine_c = {
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = {
              error = ' ',
              warn = ' ',
              info = ' ',
              hint = '󰌵 ',
            },
          },
          {
            'filename',
            path = 3,
            symbols = {
              modified = ' ',
              readonly = '  ',
            },
          },
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_c = {
          {
            'filename',
            path = 3,
            symbols = {
              modified = ' ',
              readonly = '  ',
            },
          },
        },
        lualine_x = { 'location' },
      },
    },
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
      {
        '3rd/image.nvim',
        dependencies = {
          {
            'vhyrro/luarocks.nvim',
            priority = 1001,
            opts = {
              rocks = { 'magick' },
            },
          },
        },
        opts = {
          integrations = {
            markdown = { enabled = false },
          },
        },
      },
      {
        's1n7ax/nvim-window-picker',
        version = '2.*',
        event = 'VeryLazy',
        opts = {
          filter_rules = {
            autoselect_one = true,
            include_current_win = false,
            -- ignore windows by buffer options
            bo = {
              filetype = {
                'neo-tree',
                'neo-tree-popup',
                'notify',
                'scrollview',
                'scrollview_sign',
                'incline',
              },
              buftype = {
                'terminal',
                'quickfix',
              },
            },
          },
          highlights = {
            statusline = {
              unfocused = {
                bg = '#a95721',
              },
            },
            winbar = {
              unfocused = {
                bg = '#a95721',
              },
            },
          },
        },
      },
    },
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
            modified = '',
            renamed = '󰘎 ',
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
              { 'git_status', zindex = 20, align = 'right', hide_when_expanded = true },
              { 'diagnostics', errors_only = true, zindex = 20, align = 'right', hide_when_expanded = true },
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
              { 'git_status', zindex = 20, align = 'right' },
              { 'diagnostics', zindex = 20, align = 'right' },
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

          ['<Tab>'] = { 'toggle_preview', config = { use_float = true } },
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
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'rcarriga/nvim-notify',
    },
    event = 'VeryLazy',
    keys = {
      { '<leader>tf', '<Cmd>Telescope find_files<CR>', desc = 'Telescope: find files' },
      { '<leader>tg', '<Cmd>Telescope live_grep<CR>', desc = 'Telescope: find words' },
      { '<leader>tm', '<Cmd>Telescope marks<CR>', desc = 'Telescope: show marks' },
      { '<leader>th', '<Cmd>Telescope oldfiles<CR>', desc = 'Telescope: show history of opened files' },
      { '<leader>tc', '<Cmd>Telescope colorscheme<CR>', desc = 'Telescope: show colorschemes' },
      { '<leader>tn', '<Cmd>Telescope notify<CR>', desc = 'Telescope: show notifications' },
    },
    config = function()
      -- NOTE: cannot put setup's argument into the 'opts' field since it contains `require('telescope.actions')`
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<Esc>'] = require('telescope.actions').close,
            },
          },
        },
      }
      require('telescope').load_extension('notify')
    end,
  },
  {
    'dstein64/nvim-scrollview',
    event = 'VeryLazy',
    opts = {
      winblend = 25,
      signs_column = 1,
      signs_max_per_row = 1,
      cursor_symbol = '•',
      diagnostics_error_symbol = '-',
      diagnostics_warn_symbol = '-',
      signs_on_startup = {
        'cursor',
        'search',
        'diagnostics',
      },
      excluded_filetypes = {
        'notify',
        'TelescopePrompt',
        'neo-tree',
        'Trouble',
        'lspinfo',
        'startuptime',
        'ccc-ui',
      },
    },
    config = function(_, opts)
      require('scrollview').setup(opts)
      vim.api.nvim_set_hl(0, 'ScrollViewSearch', { fg = 'orange' })
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
    config = function ()
      require('gitsigns').setup({
        on_attach = function (bufnr)
          vim.keymap.set('n', '<Leader>gb', require('gitsigns').toggle_current_line_blame, {
              buffer = bufnr,
              silent = true,
              desc = 'Toggle showing git blame on current line',
          })
        end
      })
    end,
  },
  {
    'sindrets/diffview.nvim',
    cmd = 'DiffviewOpen',
  },
  {
    'rcarriga/nvim-notify',
    opts = {
      top_down = false,
    },
    init = function()
      vim.notify = require('notify')
    end,
  },
  { 'stevearc/dressing.nvim' },
  {
    'akinsho/toggleterm.nvim',
    opts = {
      size = function(term)
        if term.direction == 'horizontal' then
          return 10
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = '<C-`>',
      direction = 'float',
      float_opts = {
        border = 'curved',
      },
    },
    config = function(_, opts)
      require('toggleterm').setup(opts)

      -- Key bindings for executing the codes in current file

      local set_keymap = function(ft, cmd)
        vim.api.nvim_create_autocmd('Filetype', {
          group = 'Toggleterm',
          pattern = { ft },
          callback = function()
            vim.keymap.set('n', '<F5>', ":w <bar> :TermExec cmd='" .. cmd .. "'<CR>",
              { desc = 'Run the code' })
          end,
        })
      end

      local cmds = {
        ['javascript'] = 'node "%:p:."',
        ['typescript'] = 'deno run "%:p:."',
        ['python'] = 'python3 "%:p:."',
        ['c'] = 'gcc "%:p:." -o "%:p:.:r" && "./%:p:.:r"',
        ['cpp'] = 'g++ "%:p:." -o "%:p:.:r" && "./%:p:.:r"',
        ['go'] = 'go run "%:p:."',
      }

      vim.api.nvim_create_augroup('Toggleterm', { clear = true })

      for ft, cmd in pairs(cmds) do
        set_keymap(ft, cmd)
      end

      -- Key bindings for sending selected lines to the opened terminal

      local files = {
        'python',
        'javascript',
        'r',
      }

      for _, ft in ipairs(files) do
        vim.api.nvim_create_autocmd('Filetype', {
          group = 'Toggleterm',
          pattern = { ft },
          callback = function()
            vim.keymap.set('x', '<C-Enter>', ':<C-u>ToggleTermSendVisualLines<CR>',
              { silent = true, desc = 'Send selection to the terminal' })
          end,
        })
      end
    end,
  },
  {
    'NvChad/nvim-colorizer.lua',
    opts = {
      filetypes = {
        'html',
        'css',
        'scss',
        'js',
        'ts',
        'vue',
        'svelte',
        'lua',
        'vim',
      },
      user_default_options = {
        mode = 'virtualtext',
        css = true,
        tailwind = true,
      },
    },
  },
  {
    'uga-rosa/ccc.nvim',
    cmd = 'CccPick',
    keys = {
      { '<leader>cp', '<Cmd>CccPick<CR>', desc = 'Pick color' },
    },
    opts = {
      highlighter = {
        auto_enable = false,
      },
      point_char = '|',
      empty_point_bg = false,
      point_color_on_light = '#333333',
    },
  },
}
