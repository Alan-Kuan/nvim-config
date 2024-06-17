return {
  { 'h-hg/fcitx.nvim', event = 'VeryLazy' },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function ()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function ()
      require('which-key').setup()
      vim.keymap.set('n', '<C-/>', '<Cmd>WhichKey<CR>', { desc = 'Show all keymaps' })
    end
  },
  {
    'gbprod/substitute.nvim',
    event = 'VeryLazy',
    opts = {
      highlight_substituted_text = {
        enabled = false,
      },
    },
    config = function (_, opts)
      require('substitute').setup(opts)

      vim.keymap.set('n', '<C-p>', require('substitute').operator, { desc = 'Substitute operator' })
      vim.keymap.set('x', '<C-p>', require('substitute').visual, { desc = 'Substitute selection without overwriting the buffer' })
    end
  },
  {
    'mrjones2014/smart-splits.nvim',
    opts = {
      default_amount = 1,
      at_edge = 'stop',
    },
    config = function(_, opts)
      require('smart-splits').setup(opts)

      -- move cursor
      vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left,
        { desc = 'Move cursor to the left split' })
      vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down,
        { desc = 'Move cursor to the lower split' })
      vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up,
        { desc = 'Move cursor to the upper split' })
      vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right,
        { desc = 'Move cursor to the right split' })

      -- resize split
      vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left,
        { desc = 'Increase left border of current split' })
      vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down,
        { desc = 'Increase bottom border of current split' })
      vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up,
        { desc = 'Increase top border of current split' })
      vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right,
        { desc = 'Increase right border of current split' })

      -- move split
      vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left,
        { desc = 'Swap current split with the left split' })
      vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down,
        { desc = 'Swap current split with the lower split' })
      vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up,
        { desc = 'Swap current split with the upper split' })
      vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right,
        { desc = 'Swap current split with the right split' })
    end,
  },
  {
    'famiu/bufdelete.nvim',
    cmd = 'Bdelete',
    keys = {
      { '<Leader>q', '<Cmd>Bdelete<CR>', silent = true, desc = 'Close current buffer without affecting the window layout' },
    },
  },
  {
    'kaarmu/typst.vim',
    ft = 'typst',
    lazy = false,
    init = function ()
      vim.g.typst_pdf_viewer = 'zathura'
    end
  },
  {
    'Fymyte/rasi.vim',  -- NOTE: rasi is rofi's config file type
    requires = 'nvim-treesitter/nvim-treesitter',
    ft = 'rasi',
  },
}
