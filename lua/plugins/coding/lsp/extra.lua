return {
  -- used by blink.cmp
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        'lazy.nvim',
        'nvim-dap-ui',
      },
    },
  },
  { 'barreiroleo/ltex-extra.nvim' },
}
