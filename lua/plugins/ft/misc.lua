return {
  {
    'kaarmu/typst.vim',
    ft = 'typst',
    lazy = false,
    init = function() vim.g.typst_pdf_viewer = 'zathura' end,
  },
  {
    'davidmh/mdx.nvim',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    opts = {},
  },
}
