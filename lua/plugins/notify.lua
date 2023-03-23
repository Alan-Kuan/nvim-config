return {
    {
        'rcarriga/nvim-notify',
        opts = {
            top_down = false,
        },
        init = function ()
            vim.notify = require('notify')
        end,
    }
}
