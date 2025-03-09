return {
  {
    'kaarmu/typst.vim',
    ft = 'typst',
    keys = {
      { '<LocalLeader>t', '<Cmd>TypstWatch<CR>', desc = 'Start Typst Preview' },
    },
    config = function() vim.g.typst_pdf_viewer = 'zathura' end,
  },
  {
    'davidmh/mdx.nvim',
    event = 'BufEnter *.mdx',
    opts = {},
  },
}
