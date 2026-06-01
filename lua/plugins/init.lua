require('lazy').setup({
  { import = 'plugins.lsp' },
  { import = 'plugins.treesitter' },
  { import = 'plugins.ui' },          -- koda (default) + theme collection
  { import = 'plugins.debug' },
  { import = 'plugins.misc' },
  { import = 'plugins.autopairs' },
  { import = 'plugins.gitsigns' },
  { import = 'plugins.lint' },
  { import = 'plugins.flash' },
  { import = 'plugins.fidget' },
  { import = 'plugins.vim-tpipeline' },
  { import = 'plugins.vim-tmux-navigator' },
  { import = 'plugins.move' },
  { import = 'plugins.neogit' },
  { import = 'plugins.snacks' },
  { import = 'plugins.navigation' },   -- oil + grapple + outline + atone
  { import = 'plugins.nvim_tree' },    -- nvim-tree sidebar (from Salar)
  { import = 'plugins.tasks' },
  { import = 'plugins.quickfix' },
  { import = 'plugins.render-markdown' },
  { import = 'plugins.noice' },
  { import = 'plugins.obsidian' },     -- Salar's superior obsidian setup
  { import = 'plugins.tabout' },
  { import = 'plugins.smear_cursor' }, -- cursor smear animation (from Salar)
  -- bufferline removed (was buggy)
  { import = 'plugins.lualine' },      -- statusline (from Salar)
  { import = 'plugins.satellite' },    -- scrollbar (from Salar)
  { import = 'plugins.drop' },         -- falling particles on dashboard (from Salar)
  { import = 'plugins.dressing' },     -- enhanced vim.ui.select (from Salar)
}, {
  checker = { enabled = true },
  change_detection = { notify = false },
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
})
