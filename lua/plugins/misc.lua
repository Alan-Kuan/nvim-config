return {
  { 'h-hg/fcitx.nvim', event = 'VeryLazy' },
  {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('which-key').setup()
    end,
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
    'Fymyte/rasi.vim',
    requires = 'nvim-treesitter/nvim-treesitter',
    ft = 'rasi',
  },
}
