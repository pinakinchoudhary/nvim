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

-- Transparent background — re-applied after every colorscheme change
-- Matches your original commit (d16e256): transparent core editor + file trees
local function apply_transparency()
  local hl = vim.api.nvim_set_hl
  -- Core editor (active + inactive)
  hl(0, 'Normal',      { bg = 'none' })
  hl(0, 'NormalNC',    { bg = 'none' })
  hl(0, 'NormalFloat', { bg = 'none' })
  hl(0, 'SignColumn',  { bg = 'none' })
  hl(0, 'EndOfBuffer', { bg = 'none' })
  hl(0, 'LineNr',      { bg = 'none' })
  hl(0, 'FoldColumn',  { bg = 'none' })
  -- Oil
  hl(0, 'OilNormal',       { bg = 'none' })
  hl(0, 'OilFloat',        { bg = 'none' })
  hl(0, 'OilFloatBorder',  { bg = 'none' })
  -- nvim-tree
  hl(0, 'NvimTreeNormal',       { bg = 'none' })
  hl(0, 'NvimTreeNormalNC',     { bg = 'none' })
  hl(0, 'NvimTreeEndOfBuffer',  { bg = 'none' })
  hl(0, 'NvimTreeWinSeparator', { bg = 'none' })
  hl(0, 'NvimTreeStatusLine',   { bg = 'none' })
  hl(0, 'NvimTreeStatusLineNC', { bg = 'none' })
end

vim.api.nvim_create_autocmd('ColorScheme', {
  desc = 'Re-apply transparent background after every theme change',
  group = vim.api.nvim_create_augroup('transparent-bg', { clear = true }),
  callback = apply_transparency,
})

-- Also apply on startup (ColorScheme fires after plugins load, but we want
-- it applied for the very first frame too)
vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Apply transparent background on startup',
  group = vim.api.nvim_create_augroup('transparent-bg-enter', { clear = true }),
  once = true,
  callback = apply_transparency,
})
