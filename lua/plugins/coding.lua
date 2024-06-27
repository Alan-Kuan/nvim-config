return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      exclude = {
        buftypes = {
          'terminal',
          'nofile',
        },
        filetypes = {
          'markdown',
          'txt',
          'help',
          'notify',
          'TelescopePrompt',
          'neo-tree',
          'Trouble',
          'lspinfo',
          'lsp-installer',
          'startuptime',
        },
      },
    },
  },
  {
    'echasnovski/mini.cursorword',
    event = 'VeryLazy',
    init = function()
      vim.api.nvim_create_augroup('MiniCursorWord', { clear = true })
      vim.api.nvim_create_autocmd('Filetype', {
        group = 'MiniCursorWord',
        pattern = {
          'markdown',
          'txt',
          'help',
          'qf', -- quickfix
          'notify',
          'TelescopePrompt',
          'neo-tree',
          'Trouble',
          'lspinfo',
          'lsp-installer',
          'startuptime',
          'toggleterm',
          'dashboard',
          'alpha',
        },
        callback = function()
          vim.b['minicursorword_disable'] = true
        end,
      })
    end,
    config = function()
      require('mini.cursorword').setup {}
      vim.api.nvim_set_hl(0, 'MiniCursorWord', { bg = '#4d4531' })
    end,
  },
  {
    'echasnovski/mini.trailspace',
    event = 'VeryLazy',
    config = function()
      require('mini.trailspace').setup()
      vim.api.nvim_set_hl(0, 'Minitrailspace', { bg = '#e6a583' })
    end,
  },
  {
    'echasnovski/mini.surround',
    event = 'VeryLazy',
    keys = {
      -- NOTE: ':' moves the cursor to command line and '<C-u>' clear the command line
      { 'S', ":<C-u>lua MiniSurround.add('visual')<CR>", mode = 'x', desc = 'Wrap selection with specified character', silent = true },
      { 'yss', 'ys_', desc = 'Wrap current line with specified character', remap = true },
    },
    opts = {
      custom_surroundings = {
        ['('] = { output = { left = '( ', right = ' )' } },
        ['['] = { output = { left = '[ ', right = ' ]' } },
        ['{'] = { output = { left = '{ ', right = ' }' } },
        ['<'] = { output = { left = '< ', right = ' >' } },
      },
      mappings = {
        add = 'ys',
        delete = 'ds',
        find = 'gs',
        find_left = 'gS',
        highlight = '',
        replace = 'cs',
        update_n_lines = '',
      },
    },
    config = function (_, opts)
      require('mini.surround').setup(opts)
      vim.keymap.del('v', 'ys')
    end
  },
  {
    'echasnovski/mini.pairs',
    event = 'VeryLazy',
    opts = {
      mappings = {
        [' '] = { action = 'open', pair = '  ', neigh_pattern = '[%(%[{][%)%]}]' },
      },
    },
    config = function(_, opts)
      require('mini.pairs').setup(opts)
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    config = true,
  },
  {
    'echasnovski/mini.comment',
    version = false,
    dependencies = 'JoosepAlviste/nvim-ts-context-commentstring',
    event = 'VeryLazy',
    opts = {
      options = {
        custom_commentstring = function()
          return require('ts_context_commentstring.internal').calculate_commentstring() or vim.bo.commentstring
        end,
      },
    },
    config = function(_, opts)
      require('mini.comment').setup(opts)
    end,
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    init = function()
      vim.g.skip_ts_context_commentstring_module = true
    end,
    opts = {
      enable_autocmd = false,
      languages = {
        cpp = {
          __default = '// %s',
        },
        c = {
          __default = '// %s',
        },
        yuck = {
          __default = '; %s',
        },
      },
    },
  },
  {
    'echasnovski/mini.splitjoin',
    event = 'VeryLazy',
    opts = {
      mappings = {
        toggle = '<C-s>',
      },
    },
  },
  {
    'echasnovski/mini.move',
    event = 'VeryLazy',
    opts = {
      mappings = {
        left = '<S-Tab>',
        right = '<Tab>',
        line_up = '',
        line_down = '',
        line_left = '',
        line_right = '',
      },
    },
  },
  {
    'mhartington/formatter.nvim',
    event = 'VeryLazy',
    keys = {
      { '<leader>F', '<Cmd>Format<CR>', desc = 'Format the code', silent = true },
    },
    config = function()
      local util = require('formatter.util')

      require('formatter').setup {
        filetype = {
          lua = {
            require('formatter.filetypes.lua').stylua,
            function()
              return {
                exe = 'stylua',
                args = {
                  '--search-parent-directories',
                  '--stdin-filepath',
                  util.escape_path(util.get_current_buffer_file_path()),
                  '--',
                  '-',
                },
                stdin = true,
              }
            end,
          },
        },
      }
    end,
  },
}
