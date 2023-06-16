return {
    { 'elkowar/yuck.vim' },
    { 'h-hg/fcitx.nvim', event = 'VeryLazy' },
    {
        'folke/which-key.nvim',
        config = function ()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require('which-key').setup()
        end
    },
}
