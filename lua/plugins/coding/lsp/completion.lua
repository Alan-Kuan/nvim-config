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
          auto_show = function(ctx)
            return ctx.mode ~= 'cmdline' or not vim.tbl_contains({ '/', '?' }, vim.fn.getcmdtype())
          end,
          draw = {
            columns = function(ctx)
              if ctx.mode == 'cmdline' then
                return {
                  { 'label' },
                }
              else
                return {
                  { 'kind_icon', 'label', gap = 1 },
                }
              end
            end,
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
    },
  },
}
