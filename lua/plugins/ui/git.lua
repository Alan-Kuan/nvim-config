return {
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
    keys = {
      { '<Leader>g', '', desc = '+git' },
      {
        '<Leader>gb',
        function() require('gitsigns').blame_line() end,
        desc = 'Git blame this line',
      },
    },
    opts = {},
  },
  {
    'sindrets/diffview.nvim',
    cmd = 'DiffviewOpen',
    keys = {
      { '<Leader>gd', '<Cmd>DiffviewOpen<CR>', desc = 'Open Git diff view' },
    },
  },
}
