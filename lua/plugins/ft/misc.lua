return {
  {
    'kaarmu/typst.vim',
    ft = 'typst',
    keys = {
      { '<LocalLeader>t', '<Cmd>TypstWatch<CR>', desc = 'Start Typst Preview', ft = 'typst' },
    },
    config = function() vim.g.typst_pdf_viewer = 'zathura' end,
  },
  {
    'davidmh/mdx.nvim',
    event = 'BufEnter *.mdx',
    opts = {},
  },
}
