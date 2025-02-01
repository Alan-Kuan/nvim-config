return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    keys = {
      {
        '<Leader>?',
        function() require('which-key').show { global = false } end,
        desc = 'Show buffer local keymaps',
      },
    },
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      preset = 'modern',
    },
  },
}
