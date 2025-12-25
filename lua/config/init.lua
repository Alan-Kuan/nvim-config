local settings = require('config.settings')

-- Neovim's diagnostic config
vim.diagnostic.config {
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = settings.diagnostic_symbols.ERROR,
      [vim.diagnostic.severity.WARN] = settings.diagnostic_symbols.WARN,
      [vim.diagnostic.severity.INFO] = settings.diagnostic_symbols.INFO,
      [vim.diagnostic.severity.HINT] = settings.diagnostic_symbols.HINT,
    },
  },
}
