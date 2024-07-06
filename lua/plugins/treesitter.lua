return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'astro',
        'awk',
        'bash',
        'c',
        'comment',
        'cpp',
        'css',
        'diff',
        'dockerfile',
        'go',
        'html',
        'javascript',
        'json',
        'latex',
        'lua',
        'make',
        'markdown',
        'php',
        'python',
        'rasi',
        'rust',
        'scss',
        'sql',
        'svelte',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'vue',
        'yaml',
        'yuck',
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    event = 'VeryLazy',
    opts = {
      mode = 'topline',
    },
  },
}
