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
        'help',
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
        'typescript',
        'vim',
        'vue',
        'yaml',
        'yuck',
      },
      highlight = {
        enable = true,
        disable = {
          'markdown',
        },
      },
      indent = {
        enable = true,
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
}
