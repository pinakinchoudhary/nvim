return {
  -- lazy.nvim UI options
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },

  -- plugins (numeric entries only)
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        styles = {
          comments = {},
        },
      }

      vim.cmd.colorscheme 'catppuccin'
      -- transparent background
      local hl = vim.api.nvim_set_hl

      -- Core editor (active + inactive)
      hl(0, 'Normal', { bg = 'none' })
      hl(0, 'NormalNC', { bg = 'none' })
      hl(0, 'NormalFloat', { bg = 'none' })
      hl(0, 'SignColumn', { bg = 'none' })
      hl(0, 'EndOfBuffer', { bg = 'none' })
      hl(0, 'LineNr', { bg = 'none' })
      hl(0, 'FoldColumn', { bg = 'none' })

      hl(0, 'OilNormal', { bg = 'none' })
      hl(0, 'OilFloat', { bg = 'none' })
      hl(0, 'OilFloatBorder', { bg = 'none' })
    end,
  },

  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
}
