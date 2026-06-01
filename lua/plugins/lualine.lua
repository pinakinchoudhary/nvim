-- Lualine: statusline that auto-syncs with theme changes
-- From Salar's config
return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    config = function()
      local lualine = require 'lualine'
      local lazy_status = require 'lazy.status'

      lualine.setup {
        options = {
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          globalstatus = true,
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = {
            {
              lazy_status.updates,
              cond = lazy_status.has_updates,
              color = { fg = '#ff9e64' },
            },
            { 'encoding' },
            { 'fileformat' },
            { 'filetype' },
          },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
      }

      -- Re-sync lualine on every colorscheme change
      vim.api.nvim_create_autocmd('ColorScheme', {
        group = vim.api.nvim_create_augroup('LualineThemeSync', { clear = true }),
        callback = function()
          lualine.refresh()
        end,
      })
    end,
  },
}
