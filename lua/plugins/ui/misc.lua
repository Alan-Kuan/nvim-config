return {
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
    opts = function()
      return {
        select = {
          telescope = require('telescope.themes').get_cursor(),
        },
      }
    end,
  },
}
