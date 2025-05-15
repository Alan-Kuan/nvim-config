return {
  {
    'dstein64/nvim-scrollview',
    event = { 'BufReadPre', 'BufNewFile', 'BufWritePost' },
    opts = {
      winblend = 25,
      hide_on_cursor_intersect = true,
      signs_max_per_row = 1,
      cursor_symbol = '•',
      diagnostics_error_symbol = '-',
      diagnostics_warn_symbol = '-',
      diagnostics_severities = {
        vim.diagnostic.severity.ERROR,
        vim.diagnostic.severity.WARN,
      },
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

      Snacks.toggle({
        name = 'Scroll View',
        get = function() return vim.g.scrollview_enabled end,
        set = function(state)
          if state then
            vim.cmd('ScrollViewEnable')
          else
            vim.cmd('ScrollViewDisable')
          end
        end,
      }):map('<leader>ts')
    end,
  },
}
