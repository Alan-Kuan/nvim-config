return {
  {
    'NvChad/nvim-colorizer.lua',
    opts = {
      filetypes = {
        'html',
        'css',
        'scss',
        'js',
        'ts',
        'vue',
        'svelte',
        'lua',
        'vim',
      },
      user_default_options = {
        mode = 'virtualtext',
        css = true,
        tailwind = true,
      },
    },
  },
  {
    'uga-rosa/ccc.nvim',
    cmd = 'CccPick',
    keys = {
      { '<leader>cp', '<Cmd>CccPick<CR>', desc = 'Pick color' },
    },
    opts = {
      highlighter = {
        auto_enable = false,
      },
      point_char = '|',
      empty_point_bg = false,
      point_color_on_light = '#333333',
    },
  },
}
