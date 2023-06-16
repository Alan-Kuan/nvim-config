return {
  {
    '2nthony/vitesse.nvim',
    dependencies = 'tjdevries/colorbuddy.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      comment_italics = true,
      transparent_background = false,
      transparent_float_background = false,
      reverse_visual = false,
      dim_nc = true,
      cmp_cmdline_disable_search_highlight_group = true,
    },
    config = function(_, opts)
      require('vitesse').setup(opts)

      vim.cmd('colorscheme vitesse')

      local function update_highlight(name, hl)
        local old_hl = vim.api.nvim_get_hl(0, { name = name })
        local new_hl = vim.tbl_extend('force', old_hl, hl)
        vim.api.nvim_set_hl(0, name, new_hl)
      end

      -- Editor
      update_highlight('Normal', { bg = '#222222' })
      update_highlight('NormalNC', { bg = '#222222' })

      -- Word
      vim.api.nvim_set_hl(0, 'Visual', { bg = '#31474d' })
      -- vim.api.nvim_set_hl(0, 'Search', { bg = '#5f3c25', reverse = false })
      -- vim.api.nvim_set_hl(0, 'IncSearch', { bg = '#5f3c25' })

      -- Sign Column
      vim.api.nvim_set_hl(0, 'SignColumn', { link = 'Normal' })

      -- HTML/Markdown
      update_highlight('htmlItalic', { italic = true })
      update_highlight('htmlBoldItalic', { italic = true })
      update_highlight('htmlUnderlineItalic', { italic = true })
      update_highlight('htmlBoldUnderlineItalic', { italic = true })
    end,
  },
}
