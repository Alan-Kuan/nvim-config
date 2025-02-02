return {
  -- used by neo-tree.nvim
  {
    's1n7ax/nvim-window-picker',
    version = '2.*',
    event = 'VeryLazy',
    opts = {
      filter_rules = {
        autoselect_one = true,
        include_current_win = false,
        -- ignore windows by buffer options
        bo = {
          filetype = {
            'neo-tree',
            'neo-tree-popup',
            'notify',
            'scrollview',
            'scrollview_sign',
            'incline',
          },
          buftype = {
            'terminal',
            'quickfix',
          },
        },
      },
      highlights = {
        statusline = {
          unfocused = {
            bg = '#a95721',
          },
        },
        winbar = {
          unfocused = {
            bg = '#a95721',
          },
        },
      },
    },
  },
}
