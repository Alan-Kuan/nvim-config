local settings = require('config.settings')

return {
  {
    'davidmh/mdx.nvim',
    enabled = settings.langs.mdx.enabled,
    event = 'BufEnter *.mdx',
    opts = {},
  },
}
