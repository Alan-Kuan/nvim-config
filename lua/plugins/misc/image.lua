return {
  -- for displaying images in NeoVim
  -- also used by neo-tree.nvim for image preview
  {
    '3rd/image.nvim',
    opts = {
      integrations = {
        markdown = { enabled = false },
      },
    },
  },
}
