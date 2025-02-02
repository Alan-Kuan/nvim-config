return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    event = 'VeryLazy',
    keys = {
      { '<leader>t', '', desc = '+telescope' },
      { '<C-p>', '<Cmd>Telescope find_files<CR>', desc = 'Find files' },
      { '<C-/>', '<Cmd>Telescope live_grep<CR>', desc = 'Find words' },
      { '<leader>tm', '<Cmd>Telescope marks<CR>', desc = 'Show marks' },
      {
        '<leader>th',
        '<Cmd>Telescope oldfiles<CR>',
        desc = 'Show history of opened files',
      },
      {
        '<leader>tc',
        '<Cmd>Telescope colorscheme<CR>',
        desc = 'Show colorschemes',
      },
      {
        '<leader>tn',
        '<Cmd>Telescope notify<CR>',
        desc = 'Show notifications',
      },
    },
    config = function()
      -- NOTE: cannot put setup's argument into the 'opts' field since it contains `require('telescope.actions')`
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<Esc>'] = require('telescope.actions').close,
            },
          },
        },
      }
      require('telescope').load_extension('notify')
    end,
  },
}
