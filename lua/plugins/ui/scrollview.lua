return {
  {
    'dstein64/nvim-scrollview',
    event = 'VeryLazy',
    keys = {
      { '<Leader>us', '<Cmd>ScrollViewToggle<Cr>', desc = 'Toggle ScrollView' },
    },
    opts = {
      winblend = 25,
      signs_column = 1,
      signs_max_per_row = 1,
      cursor_symbol = '•',
      diagnostics_error_symbol = '-',
      diagnostics_warn_symbol = '-',
      signs_on_startup = {
        'conflicts',
        'cursor',
        'diagnostics',
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
      require('scrollview.contrib.gitsigns').setup()
      vim.api.nvim_set_hl(0, 'ScrollViewSearch', { fg = 'orange' })
    end,
  },
}
