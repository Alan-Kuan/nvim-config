return {
  {
    'saghen/blink.cmp',
    version = '*',
    dependencies = 'L3MON4D3/LuaSnip',
    event = 'InsertEnter',
    opts = {
      completion = {
        list = {
          selection = { preselect = false, auto_insert = true },
        },
        menu = {
          draw = {
            columns = {
              { 'label', gap = 1 },
              { 'kind_icon', 'kind', gap = 1 },
              { 'source_name' },
            },
          },
        },
      },
      keymap = {
        preset = 'super-tab',
        cmdline = { preset = 'default' },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      snippets = { preset = 'luasnip' },
    },
  },
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    config = function()
      require('luasnip.loaders.from_lua').load {
        paths = { '~/.config/nvim/lua/snippets' },
      }
    end,
  },
}
