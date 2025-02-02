return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
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
}
