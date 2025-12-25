local settings = require('config.settings')

return {
  {
    'kaarmu/typst.vim',
    enabled = settings.langs.typst.enabled,
    ft = 'typst',
    keys = {
      { '<LocalLeader>t', '<Cmd>TypstWatch<CR>', desc = 'Start Typst Preview', ft = 'typst' },
    },
    config = function() vim.g.typst_pdf_viewer = 'zathura' end,
  },
}
