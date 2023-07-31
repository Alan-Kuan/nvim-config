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
    'seblj/nvim-tabline',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = 'VeryLazy',
    opts = {
      no_name = '[New File]',
      modified_icon = '',
      close_icon = '',
      separator = '▌',
      padding = 1,
      color_all_icons = false,
      right_separator = false,
      show_index = false,
      show_icon = true,
    },
    config = function(_, opts)
      local tabline_bg = '#444444'
      local tabline_fill_bg = '#555555'
      local modified_fg = '#fcba03'
      -- get background color of highlight group Normal
      local normal_bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID('Normal')), 'bg#')

      vim.api.nvim_set_hl(0, 'TabLineFill', { bg = tabline_fill_bg })

      vim.api.nvim_set_hl(0, 'TabLine', { bg = tabline_bg, underline = false })
      vim.api.nvim_set_hl(0, 'TabLineModified', { fg = modified_fg, bg = tabline_bg })

      vim.api.nvim_set_hl(0, 'TabLineSel', { bg = normal_bg })
      vim.api.nvim_set_hl(0, 'TabLineModifiedSel', { fg = modified_fg, bg = normal_bg })
      vim.api.nvim_set_hl(0, 'TabLineSeparatorSel', { fg = 'skyblue', bg = normal_bg })

      require('tabline').setup(opts)
    end,
  },
  {
    'hoob3rt/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = 'VeryLazy',
    opts = {
      options = {
        disabled_filetypes = { 'help', 'qf', 'Trouble' },
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
    config = function(_, opts)
      local custom_vitesse = require('lualine.themes.vitesse')
      local dark_soft_bg = '#222222'
      local dark_softer_bg = '#333333'

      custom_vitesse.normal.b.bg = dark_softer_bg
      custom_vitesse.visual.b.bg = dark_softer_bg
      custom_vitesse.insert.b.bg = dark_softer_bg
      custom_vitesse.replace.b.bg = dark_softer_bg
      custom_vitesse.command.b.bg = dark_softer_bg
      custom_vitesse.terminal.b.bg = dark_softer_bg
      custom_vitesse.inactive.b.bg = dark_softer_bg
      custom_vitesse.normal.c.bg = dark_soft_bg
      custom_vitesse.inactive.c.bg = dark_soft_bg

      opts.options.theme = custom_vitesse

      require('lualine').setup(opts)
    end,
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
      {
        's1n7ax/nvim-window-picker',
        tag = 'v1.5',
        opts = {
          autoselect_one = true,
          include_current = false,
          filter_rules = {
            -- ignore windows by buffer options
            bo = {
              filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
              buftype = { 'terminal', 'quickfix' },
            },
          },
          other_win_hl_color = '#a95721',
        },
      },
    },
    cmd = 'Neotree',
    keys = {
      { '-', '<Cmd>Neotree toggle<CR>', desc = 'Toggle the file explorer' },
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
    config = function(_, opts)
      require('neo-tree').setup(opts)

      local neotree_bg = '#333333'
      vim.api.nvim_set_hl(0, 'NeotreeNormal', { bg = neotree_bg })
      vim.api.nvim_set_hl(0, 'NeotreeNormalNC', { bg = neotree_bg })
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'rcarriga/nvim-notify',
    },
    event = 'VeryLazy',
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

      -- stylua: ignore start
      vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end)
      vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep() end)
      vim.keymap.set('n', '<leader>fb', function() require('telescope.builtin').marks() end)
      vim.keymap.set('n', '<leader>fh', function() require('telescope.builtin').oldfiles() end)
      vim.keymap.set('n', '<leader>cc', function() require('telescope.builtin').colorscheme() end)
      vim.keymap.set('n', '<leader>nc', function() require('telescope').extensions.notify.notify() end)
      -- stylua: ignore end
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
    'rcarriga/nvim-notify',
    opts = {
      top_down = false,
    },
    init = function()
      vim.notify = require('notify')
    end,
  },
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
            vim.keymap.set('n', '<F5>', ":w <bar> :TermExec cmd='" .. cmd .. "'<CR>")
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
            vim.keymap.set('x', '<C-Enter>', ':<C-u>ToggleTermSendVisualLines<CR>', { silent = true })
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
      point_char = '▮',
      empty_point_bg = false,
      point_color_on_light = '#333333',
    },
  },
}
