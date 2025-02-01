return {
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
    opts = function()
      return {
        on_attach = function(bufnr)
          vim.keymap.set('n', '<Leader>gb', require('gitsigns').toggle_current_line_blame, {
            buffer = bufnr,
            silent = true,
            desc = 'Toggle showing git blame on current line',
          })
        end,
      }
    end,
  },
  {
    'sindrets/diffview.nvim',
    cmd = 'DiffviewOpen',
  },
}
