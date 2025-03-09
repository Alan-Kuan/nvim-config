return {
  {
    'snacks.nvim',
    keys = {
      {
        '<Leader>q',
        function() Snacks.bufdelete() end,
        desc = 'Close current buffer without affecting the window layout',
      },
    },
  },
  {
    'mrjones2014/smart-splits.nvim',
    keys = {
      -- move cursor
      {
        '<C-h>',
        function() require('smart-splits').move_cursor_left() end,
        { desc = 'Move cursor to the left split' },
      },
      {
        '<C-j>',
        function() require('smart-splits').move_cursor_down() end,
        { desc = 'Move cursor to the below split' },
      },
      {
        '<C-k>',
        function() require('smart-splits').move_cursor_up() end,
        { desc = 'Move cursor to the above split' },
      },
      {
        '<C-l>',
        function() require('smart-splits').move_cursor_right() end,
        { desc = 'Move cursor to the right split' },
      },
      -- resize split
      {
        '<A-h>',
        function() require('smart-splits').resize_left() end,
        desc = 'Increase left border of current split',
      },
      {
        '<A-j>',
        function() require('smart-splits').resize_down() end,
        desc = 'Increase bottom border of current split',
      },
      {
        '<A-k>',
        function() require('smart-splits').resize_up() end,
        desc = 'Increase top border of current split',
      },
      {
        '<A-l>',
        function() require('smart-splits').resize_right() end,
        desc = 'Increase right border of current split',
      },
      -- move split
      {
        '<Leader><Leader>h',
        function() require('smart-splits').swap_buf_left() end,
        desc = 'Swap current split with the left split',
      },
      {
        '<Leader><Leader>j',
        function() require('smart-splits').swap_buf_down() end,
        desc = 'Swap current split with the below split',
      },
      {
        '<Leader><Leader>k',
        function() require('smart-splits').swap_buf_up() end,
        desc = 'Swap current split with the above split',
      },
      {
        '<Leader><Leader>l',
        function() require('smart-splits').swap_buf_right() end,
        desc = 'Swap current split with the right split',
      },
    },
    opts = {
      default_amount = 1,
      at_edge = 'stop',
    },
  },
}
