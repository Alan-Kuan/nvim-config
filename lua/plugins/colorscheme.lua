return {
  {
    'Shatur/neovim-ayu',
    name = 'ayu',
    lazy = false,
    priority = 1000,
    opts = {
      mirage = true,
      overrides = {
        Search = { bg = '#3d3750', fg = 'NONE' },
        IncSearch = { bg = '#3d3750', fg = 'NONE' },
        CurSearch = { bg = '#695380', fg = 'NONE' },
        LineNr = { fg = 'NvimDarkGray4' },
        WinSeparator = { fg = 'NvimDarkGray4' },
      },
    },
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
  },
}
