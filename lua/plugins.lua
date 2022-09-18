require('packer').startup(function (use)
    -- [[ Fundamental ]] --
	use 'wbthomason/packer.nvim'
    use {
        'echasnovski/mini.nvim',
        branch = 'stable',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function ()
            require('configs.misc')
        end
    }
    use {
        'lewis6991/impatient.nvim',
        config = function ()
            require('impatient')
        end
    }

    -- [[ Colors ]] --
    use 'morhetz/gruvbox'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function ()
            require('configs.treesitter')
        end
    }

    -- [[ UI ]] --
    use {
        'seblj/nvim-tabline',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function ()
            require('configs.tabline')
        end
    }
    use {
        'hoob3rt/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function ()
            require('configs.lualine')
        end
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        cmd = { 'NvimTreeToggle' },
        setup = function ()
            vim.keymap.set('n', '-', '<Cmd>NvimTreeToggle<CR>', { silent = true })
        end,
        config = function ()
            require('configs.nvimtree')
        end
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function ()
            require('configs.telescope')
        end
    }
    use {
        'akinsho/toggleterm.nvim',
        config = function ()
            require('configs.toggleterm')
        end
    }
    use {
        'glepnir/dashboard-nvim',
        config = function ()
            require('configs.dashboard')
        end
    }
    use {
        'rcarriga/nvim-notify',
        config = function ()
            require('notify').setup {
                top_down = false,
            }
            vim.notify = require('notify')
        end
    }

    -- [[ LSP ]] --
    use {
        'williamboman/nvim-lsp-installer',
        config = function ()
            require('configs.lsp_installer')
        end
    }
    use {
        'neovim/nvim-lspconfig',
        config = function ()
            require('configs.lspconfig')
        end
    }
    use {
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function ()
            require('trouble').setup {
                action_keys = { refresh = 'R' },
                auto_close = true, -- automatically close the list when you have no diagnostics
                use_diagnostic_signs = true -- enabling this will use the signs defined in your lsp client
            }
            vim.keymap.set('n', '<leader>xx', '<Cmd>TroubleToggle<CR>', { silent = true })
        end
    }
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-calc',
            'hrsh7th/cmp-emoji',
        },
        config = function ()
            require('configs.cmp')
        end
    }
    use 'L3MON4D3/LuaSnip'
    use 'onsails/lspkind-nvim'
    use {
        'ray-x/lsp_signature.nvim',
        config = function ()
            require('lsp_signature').setup({ hint_prefix = '💡 ' })
        end
    }
    use 'folke/lua-dev.nvim'

    -- [[ Utilities ]] --
    use 'dstein64/vim-startuptime'
    use 'h-hg/fcitx.nvim'
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use {
        'RRethy/vim-hexokinase',
        run = 'make hexokinase'
    }
    use {
        'chentoast/marks.nvim',
        config = function ()
            require('configs.marks')
        end
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function ()
            require('configs.indent')
        end
    }
    use {
        'alvan/vim-closetag',
        config = function ()
            vim.g.closetag_filenames = '*.html, *.php, *.vue, *.svelte, *.md'
            vim.g.closetag_filetypes = 'html, php, vue, svelte, markdown'
        end
    }
    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install',
        cmd = 'MarkdownPreview',
        ft = 'markdown',
        setup = function ()
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
    }
    use {
        'plasticboy/vim-markdown',
        requires = 'godlygeek/tabular',
        ft = 'markdown',
        config = function ()
            require('configs.markdown')
        end
    }
end)
