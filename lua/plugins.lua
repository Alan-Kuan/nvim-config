require('lazy').setup({
    -- [[ Colors ]] --
    {
        'morhetz/gruvbox',
        lazy = false,
        priority = 1000,
        init = function ()
            vim.cmd('colorscheme gruvbox')
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function ()
            require('configs.treesitter')
        end
    },

    -- [[ UI ]] --
    {
        'seblj/nvim-tabline',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function ()
            require('configs.tabline')
        end
    },
    {
        'hoob3rt/lualine.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function ()
            require('configs.lualine')
        end
    },
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = 'nvim-tree/nvim-web-devicons',
        cmd = 'NvimTreeToggle',
        init = function ()
            vim.keymap.set('n', '-', '<Cmd>NvimTreeToggle<CR>', { silent = true })
        end,
        config = function ()
            require('configs.nvimtree')
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        config = function ()
            require('configs.telescope')
        end
    },
    {
        'akinsho/toggleterm.nvim',
        config = function ()
            require('configs.toggleterm')
        end
    },
    {
        'glepnir/dashboard-nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        event = 'VimEnter',
        config = function ()
            require('configs.dashboard')
        end
    },
    {
        'rcarriga/nvim-notify',
        config = function ()
            require('notify').setup {
                top_down = false,
            }
            vim.notify = require('notify')
        end
    },

    -- [[ Language ]] --
    {
        'williamboman/mason.nvim',
        config = function ()
            require('configs.mason')
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function ()
            require('mason-lspconfig').setup()
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function ()
            require('configs.lspconfig')
        end
    },
    {
        'folke/trouble.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function ()
            require('trouble').setup {
                action_keys = { refresh = 'R' },
                auto_close = true, -- automatically close the list when you have no diagnostics
                use_diagnostic_signs = true -- enabling this will use the signs defined in your lsp client
            }
            vim.keymap.set('n', '<leader>xx', '<Cmd>TroubleToggle<CR>', { silent = true })
        end
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'L3MON4D3/LuaSnip',
            'onsails/lspkind-nvim'
        },
        config = function ()
            require('configs.cmp')
        end
    },
    'folke/neodev.nvim',

    -- [[ Utilities ]] --
    'h-hg/fcitx.nvim',
    {
        'echasnovski/mini.nvim',
        branch = 'stable',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function ()
            require('configs.misc')
        end
    },
    {
        'JoosepAlviste/nvim-ts-context-commentstring',
        config = function ()
            require('configs.comment')
        end
    },
    {
        'RRethy/vim-hexokinase',
        build = 'make hexokinase'
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function ()
            require('configs.indent')
        end
    },
    {
        'alvan/vim-closetag',
        config = function ()
            vim.g.closetag_filenames = '*.html, *.php, *.vue, *.svelte, *.md'
            vim.g.closetag_filetypes = 'html, php, vue, svelte, markdown'
        end
    },
    {
        'iamcco/markdown-preview.nvim',
        build = 'cd app && yarn install',
        cmd = 'MarkdownPreview',
        ft = 'markdown',
        init = function ()
            vim.api.nvim_create_augroup('MD_Preview', { clear = true })
            vim.api.nvim_create_autocmd('Filetype', {
                group = 'MD_Preview',
                pattern = { 'markdown' },
                callback = function ()
                    vim.keymap.set('n', '<C-m>', '<Cmd>MarkdownPreview<CR>', { silent = true, buffer = true })
                end
            })
        end,
        config = function ()
            vim.g.mkdp_page_title = '${name} - Preview'
            vim.g.mkdp_echo_preview_url = 1
        end
    },
    {
        'plasticboy/vim-markdown',
        dependencies = 'godlygeek/tabular',
        ft = 'markdown',
        config = function ()
            require('configs.markdown')
        end
    }
})
