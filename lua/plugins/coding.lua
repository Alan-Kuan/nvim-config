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
          'dap-repl',
          'dapui_scopes',
          'dapui_breakpoints',
          'dapui_stacks',
          'dapui_watches',
          'dapui_console',
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
      { 'S', ":<C-u>lua MiniSurround.add('visual')<CR>", mode = 'x', desc = 'Wrap selection with specified character' },
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
        -- don't trigger when typing '\(' or when next character is alphanumeric
        ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\][^A-Za-z0-9]' },
        ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\][^A-Za-z0-9]' },
        ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\][^A-Za-z0-9]' },
        -- surround cursor by a space when typing a space in a pair of closed parentheses, brackets, or curly brackets
        [' '] = { action = 'open', pair = '  ', neigh_pattern = '[%(%[{][%)%]}]' },
      },
    },
  },
  {
    'windwp/nvim-ts-autotag',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = true,
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    opts = function ()
      vim.g.skip_ts_context_commentstring_module = true

      vim.filetype.get_option = function (ft, opt)
        return opt == 'commentstring'
          and require('ts_context_commentstring.internal').calculate_commentstring()
          or vim.filetype.get_option(ft, opt)
      end

      return {
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
      }
    end,
  },
  {
    'echasnovski/mini.splitjoin',
    event = 'VeryLazy',
    opts = {
      mappings = {
        toggle = '<Leader>s',
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
}
