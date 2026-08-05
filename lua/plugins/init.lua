require('lazy').setup({
  { import = 'plugins.lsp' },
  { import = 'plugins.treesitter' },
  { import = 'plugins.ui' }, -- koda (default) + theme collection
  { import = 'plugins.debug' },
  { import = 'plugins.misc' },
  { import = 'plugins.autopairs' },
  { import = 'plugins.gitsigns' },
  { import = 'plugins.flash' },
  { import = 'plugins.fidget' },
  { import = 'plugins.vim-tmux-navigator' },
  { import = 'plugins.move' },
  { import = 'plugins.neogit' },
  { import = 'plugins.snacks' },
  { import = 'plugins.navigation' }, -- oil + grapple + outline + atone
  { import = 'plugins.tasks' },
  { import = 'plugins.quickfix' },
  { import = 'plugins.render-markdown' },
  { import = 'plugins.smear_cursor' }, -- cursor smear animation (from Salar)
  { import = 'plugins.lualine' }, -- statusline (from Salar)
  { import = 'plugins.satellite' }, -- scrollbar (from Salar)
  { import = 'plugins.parquet' },
  { import = 'plugins.dressing' }, -- enhanced vim.ui.select (from Salar)
}, {
  checker = { enabled = false }, -- no background git fetch; run :Lazy check manually
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
