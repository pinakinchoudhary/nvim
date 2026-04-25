-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Disable Treesitter for markdown buffers on Neovim 0.12.2',
  group = vim.api.nvim_create_augroup('kickstart-markdown-ts', { clear = true }),
  pattern = { 'markdown', 'markdown_inline' },
  callback = function(args)
    local buf = args.buf

    pcall(vim.treesitter.stop, buf)

    -- Neovim 0.12.2 can still try to start the markdown highlighter even when
    -- nvim-treesitter has markdown disabled. Force regex highlighting instead.
    vim.bo[buf].syntax = vim.bo[buf].filetype
  end,
})
