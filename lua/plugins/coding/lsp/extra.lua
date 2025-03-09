return {
  -- used by blink.cmp
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        'lazy.nvim',
        'nvim-dap-ui',
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        { path = 'snacks.nvim', words = { 'Snacks' } },
      },
    },
  },
  {
    'barreiroleo/ltex_extra.nvim',
    ft = {
      'text',
      'tex',
      'bib',
      'markdown',
      'html',
      'gitcommit',
    },
  },
}
