return {
  {
    'saghen/blink.cmp',
    version = '1.*',
    event = 'InsertEnter',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      appearance = {
        use_nvim_cmp_as_default = true,
      },
      completion = {
        menu = {
          draw = {
            columns = {
              { 'kind_icon', 'label', gap = 1 },
            },
          },
        },
      },
      keymap = {
        preset = 'none',
        ['<C-d>'] = { 'show_documentation', 'hide_documentation' },
        ['<C-x>'] = { 'cancel', 'hide', 'fallback' },
        ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },
      },
      signature = { enabled = true },
      sources = {
        default = { 'lazydev', 'lsp', 'omni', 'path', 'snippets', 'buffer' },
        providers = {
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            score_offset = 100,
          },
        },
      },
      -- Extra Modes
      cmdline = {
        completion = {
          list = {
            selection = { preselect = false },
          },
          menu = {
            auto_show = function ()
              return not vim.tbl_contains({ '/', '?' }, vim.fn.getcmdtype())
            end,
            draw = {
              columns = {
                { 'label' },
              },
            },
          },
        },
        keymap = {
          preset = 'inherit',
          ['<CR>'] = {},
        },
      },
    },
  },
}
