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
    'gitsigns.nvim',
    opts = function()
      Snacks.toggle({
        name = 'Git Signs',
        get = function() return require('gitsigns.config').config.signcolumn end,
        set = function(state) require('gitsigns').toggle_signs(state) end,
      }):map('<leader>tg')
    end,
  },
  {
    'sindrets/diffview.nvim',
    cmd = 'DiffviewOpen',
    keys = {
      { '<Leader>gd', '<Cmd>DiffviewOpen<CR>', desc = 'Open Git diff view' },
    },
  },
}
