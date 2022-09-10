vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_toc_autofit = 1
vim.g.vim_markdown_follow_anchor = 1
vim.g.vim_markdown_conceal = 1
vim.g.vim_markdown_conceal_code_blocks = 1
vim.g.vim_markdown_math = 1
vim.g.vim_markdown_frontmatter = 1
vim.g.vim_markdown_strikethrough = 1
vim.g.vim_markdown_new_list_item_indent = 4
vim.g.vim_markdown_edit_url_in = 'tab'

vim.o.conceallevel = 3
vim.g.tex_conceal = ''

vim.api.nvim_create_augroup('Markdown', { clear = true })
vim.api.nvim_create_autocmd('Filetype', {
    group = 'Markdown',
    pattern = { 'markdown' },
    callback = function ()
        vim.keymap.set('x', '<C-Enter>', ':<C-U>TableFormat<CR>', { silent = true })
    end
})
