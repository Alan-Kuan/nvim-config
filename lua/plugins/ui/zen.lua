return {
  {
    'snacks.nvim',
    keys = {
      { '<Leader>z', function () Snacks.zen() end, desc = 'Toggle zen mode' }
    },
    opts = {
      zen = {
        toggles = {
          dim = false,
          diagnostics = false,
        },
      },
    },
  },
}
