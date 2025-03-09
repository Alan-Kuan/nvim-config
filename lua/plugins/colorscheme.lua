return {
  {
    'Shatur/neovim-ayu',
    name = 'ayu',
    lazy = false,
    priority = 1000,
    opts = {
      mirage = true,
      overrides = {
        Search = { fg = 'NONE', bg = '#3d3750' },
        IncSearch = { fg = 'NONE', bg = '#695380' },
        CurSearch = { fg = 'NONE', bg = '#695380' },
        LineNr = { fg = 'NvimDarkGray4' },
        WinSeparator = { fg = 'NvimDarkGray4' },
        -- mini
        MiniCursorword = { bg = '#334257' },
        MiniTrailspace = { bg = '#e6a583' },
      },
    },
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    opts = {
      highlight_groups = {
        Search = { fg = 'NONE', bg = 'iris', blend = 25, inherit = false },
        IncSearch = {
          fg = 'NONE',
          bg = 'gold',
          blend = 40,
          underline = true,
          sp = 'gold',
          inherit = false,
        },
        CurSearch = { fg = 'NONE', bg = 'iris', blend = 25, inherit = false },
        -- mini
        MiniCursorword = { bg = 'iris', blend = 12, underline = false, inherit = false },
        MiniCursorwordCurrent = { underline = false, inherit = false },
        MiniTrailspace = { bg = '#e6a583', inherit = false },
      },
    },
  },
}
