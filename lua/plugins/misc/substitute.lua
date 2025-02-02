return {
  {
    'gbprod/substitute.nvim',
    event = 'VeryLazy',
    opts = {
      highlight_substituted_text = {
        enabled = false,
      },
    },
    config = function(_, opts)
      require('substitute').setup(opts)
      vim.keymap.set(
        'x',
        '<C-p>',
        require('substitute').visual,
        { desc = 'Substitute selection without overwriting the buffer' }
      )
    end,
  },
}
