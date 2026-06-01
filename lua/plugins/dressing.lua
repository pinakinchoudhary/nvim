-- Dressing: enhanced vim.ui.select and vim.ui.input (snacks handles input,
-- dressing enhances select for :Theme picker etc.)
return {
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
    opts = {
      -- vim.ui.input is already handled by snacks, only override select
      input = { enabled = false },
      select = { enabled = true },
    },
  },
}
