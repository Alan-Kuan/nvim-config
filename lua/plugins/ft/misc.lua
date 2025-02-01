return {
  {
    'kaarmu/typst.vim',
    ft = 'typst',
    lazy = false,
    init = function() vim.g.typst_pdf_viewer = 'zathura' end,
  },
  {
    'Fymyte/rasi.vim', -- NOTE: rasi is rofi's config file type
    requires = 'nvim-treesitter/nvim-treesitter',
    ft = 'rasi',
  },
  {
    'davidmh/mdx.nvim',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    opts = {},
  },
}
