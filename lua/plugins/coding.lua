return {
  {
    'lukas-reineke/indent-blankline.nvim',
    name = 'indent_blankline',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      buftype_exclude = {
        'terminal',
        'nofile',
      },
      filetype_exclude = {
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
          vim.b.minicursorword_disable = true
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
      require('mini.trailspace').setup {}
    end,
  },
  {
    'echasnovski/mini.surround',
    event = 'VeryLazy',
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
    config = function(_, opts)
      require('mini.surround').setup(opts)

      -- NOTE: ':' moves the cursor to command line and '<C-u>' clear the command line
      vim.keymap.set('x', 'S', ":<C-u>lua MiniSurround.add('visual')<CR>", { silent = true })
      vim.keymap.set('n', 'yss', 'ys_', { remap = true })
      vim.keymap.del('v', 'ys')
    end,
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
    'alvan/vim-closetag',
    event = 'VeryLazy',
    config = function()
      vim.g.closetag_filenames = '*.html, *.php, *.vue, *.svelte, *.md'
      vim.g.closetag_filetypes = 'html, php, vue, svelte, markdown'
    end,
  },
  {
    'echasnovski/mini.comment',
    version = false,
    dependencies = 'JoosepAlviste/nvim-ts-context-commentstring',
    event = 'VeryLazy',
    opts = {
      options = {
        custom_commentstring = function()
          return require('ts_context_commentstring.internal').calculate_commentstring {} or vim.bo.commentstring
        end,
      },
    },
    config = function(_, opts)
      require('mini.comment').setup(opts)
    end,
  },
  {
    'echasnovski/mini.splitjoin',
    version = '*',
    event = 'VeryLazy',
    opts = {
      mappings = {
        toggle = '<C-s>',
      },
    },
  },
  {
    'echasnovski/mini.move',
    version = '*',
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

      vim.keymap.set('n', '<leader>F', '<Cmd>Format<CR>', { silent = true })
    end,
  },
}
