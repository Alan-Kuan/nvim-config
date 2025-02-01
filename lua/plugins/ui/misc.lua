return {
  {
    'stevearc/dressing.nvim',
    dependencies = 'nvim-telescope/telescope.nvim',
    opts = function()
      return {
        select = {
          telescope = require('telescope.themes').get_cursor(),
        },
      }
    end,
  },
}
