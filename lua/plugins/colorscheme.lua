return {
  {
    'Shatur/neovim-ayu',
    name = 'ayu',
    lazy = false,
    priority = 1000,
    opts = {
      mirage = true,
      overrides = {
        Search = { bg = '#3d3750' },
        IncSearch = { bg = '#3d3750' },
        CurSearch = { bg = '#695380' },
        LineNr = { fg = 'NvimDarkGray4' },
        WinSeparator = { fg = 'NvimDarkGray4' },
      },
    },
  },
  {
    'neanias/everforest-nvim',
    name = 'everforest',
    version = false,
    lazy = false,
    priority = 1000,
  },
}
