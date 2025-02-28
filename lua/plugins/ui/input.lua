return {
  {
    'snacks.nvim',
    opts = {
      input = { enabled = true },
      styles = {
        input = {
          width = 30,
          relative = 'cursor',
          row = -3,
          col = 0,
          keys = {
            i_esc = { '<Esc>', { 'cmp_close', 'cancel' }, mode = 'i', expr = true },
          },
        },
      },
    },
  },
}
