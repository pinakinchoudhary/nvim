-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open diagnostic location list' })
vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float, { desc = 'Show line diagnostics' })
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Previous diagnostic' })
vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Next diagnostic' })

vim.keymap.set('n', '[q', '<cmd>cprev<CR>zz', { desc = 'Previous quickfix item' })
vim.keymap.set('n', ']q', '<cmd>cnext<CR>zz', { desc = 'Next quickfix item' })
vim.keymap.set('n', '[l', '<cmd>lprev<CR>zz', { desc = 'Previous location item' })
vim.keymap.set('n', ']l', '<cmd>lnext<CR>zz', { desc = 'Next location item' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Exit insert mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- find and replace current world in entire document
vim.keymap.set('n', '<leader>rw', [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { desc = 'Replace word under cursor' })

-- Or via lua api
vim.keymap.set('n', '<leader>gg', '<cmd>Neogit<cr>', { desc = 'Open Neogit UI' })

vim.keymap.set('n', '<leader>P', function()
  vim.o.paste = true
  vim.cmd 'startinsert'
  vim.notify('PASTE MODE', vim.log.levels.WARN)
end, { desc = 'Paste Mode (Enter Insert)' })

vim.api.nvim_create_autocmd('InsertLeave', {
  callback = function()
    if vim.o.paste then
      vim.o.paste = false
      vim.notify('Paste Mode Off', vim.log.levels.INFO)
    end
  end,
})
