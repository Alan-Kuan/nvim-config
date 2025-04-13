return {
  {
    'echasnovski/mini.cursorword',
    event = { 'BufReadPre', 'BufNewFile', 'BufWritePost' },
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
          'lazy',
          'mason',
        },
        callback = function() vim.b['minicursorword_disable'] = true end,
      })
    end,
    opts = {},
  },
  {
    'echasnovski/mini.trailspace',
    event = { 'BufReadPre', 'BufNewFile', 'BufWritePost' },
    opts = {},
  },
  {
    'echasnovski/mini.surround',
    event = { 'BufReadPre', 'BufNewFile', 'BufWritePost' },
    keys = {
      {
        'S',
        -- NOTE: ':' moves the cursor to command line and '<C-u>' clear the command line
        ":<C-u>lua MiniSurround.add('visual')<CR>",
        mode = 'x',
        desc = 'Wrap selection with specified character',
      },
      {
        'yss',
        'ys_',
        desc = 'Wrap current line with specified character',
        remap = true,
      },
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
    config = function(_, opts)
      require('mini.surround').setup(opts)
      vim.keymap.del('v', 'ys')
    end,
  },
  {
    'echasnovski/mini.splitjoin',
    event = { 'BufReadPre', 'BufNewFile', 'BufWritePost' },
    opts = {
      mappings = {
        toggle = '<Leader>s',
      },
    },
  },
  {
    'echasnovski/mini.move',
    event = { 'BufReadPre', 'BufNewFile', 'BufWritePost' },
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
