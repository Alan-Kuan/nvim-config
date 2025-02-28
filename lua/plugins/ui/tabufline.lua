return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    event = 'VeryLazy',
    keys = {
      { 'gb', '<Cmd>BufferLineCycleNext<CR>', desc = 'Go to next buffer' },
      { 'gB', '<Cmd>BufferLineCyclePrev<CR>', desc = 'Go to previous buffer' },
    },
    opts = {
      options = {
        indicator = {
          style = 'underline',
        },
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level, _, _)
          local icon = level:match('error') and ' ' or ' '
          return ' ' .. icon .. count
        end,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Explorer',
            text_align = 'center',
            separator = true,
          },
          {
            filetype = 'DiffviewFiles',
            text = 'Git Status',
            text_align = 'center',
            separator = true,
          },
          {
            filetype = 'dapui_scopes',
            separator = true,
          },
        },
      },
      highlights = {
        indicator_selected = {
          sp = { attribute = 'fg', highlight = 'CursorLineNr' },
        },
        buffer_selected = {
          sp = { attribute = 'fg', highlight = 'CursorLineNr' },
          italic = false,
        },
        error_selected = {
          sp = { attribute = 'fg', highlight = 'CursorLineNr' },
          italic = false,
        },
        warning_selected = {
          sp = { attribute = 'fg', highlight = 'CursorLineNr' },
          italic = false,
        },
        warning_diagnostic_selected = {
          sp = { attribute = 'fg', highlight = 'CursorLineNr' },
        },
        error_diagnostic_selected = {
          sp = { attribute = 'fg', highlight = 'CursorLineNr' },
        },
        modified_selected = {
          sp = { attribute = 'fg', highlight = 'CursorLineNr' },
        },
        close_button_selected = {
          sp = { attribute = 'fg', highlight = 'CursorLineNr' },
        },
      },
    },
  },
  {
    'tiagovla/scope.nvim',
    event = 'VeryLazy',
    opts = {},
  }
}
