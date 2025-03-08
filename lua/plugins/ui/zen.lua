return {
  {
    'snacks.nvim',
    keys = {
      { '<Leader>z', function () Snacks.zen() end, desc = 'Open zen mode' }
    },
    opts = {
      zen = {},
    },
  },
}
