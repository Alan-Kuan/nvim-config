return {
  {
    'folke/trouble.nvim',
    cmd = 'Trouble',
    keys = {
      { '<leader>x', '', desc = '+diagnostic' },
      {
        '<leader>xx',
        '<Cmd>Trouble diagnostics toggle filter.buf=0<CR>',
        desc = 'Show diagnostics of current buffer',
      },
      {
        '<leader>xX',
        '<Cmd>Trouble diagnostics toggle<CR>',
        'Show diagnostics of current workspace',
      },
    },
    opts = {
      action_keys = { refresh = 'R' },
      auto_close = true, -- automatically close the list when you have no diagnostics
      use_diagnostic_signs = true, -- enabling this will use the signs defined in your lsp client
    },
  },
  {
    'snacks.nvim',
    opts = function ()
      Snacks.toggle.diagnostics():map('<Leader>td')
    end
  },
}
