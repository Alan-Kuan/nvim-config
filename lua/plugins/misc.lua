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
      vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
      vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
      vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
      vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)

      -- resize split
      vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
      vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
      vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
      vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)

      -- move split
      vim.keymap.set('n', '<leader><leader>h', '<C-w><S-h>')
      vim.keymap.set('n', '<leader><leader>j', '<C-w><S-j>')
      vim.keymap.set('n', '<leader><leader>k', '<C-w><S-k>')
      vim.keymap.set('n', '<leader><leader>l', '<C-w><S-l>')
    end,
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
