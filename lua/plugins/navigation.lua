return {
  {
    'stevearc/oil.nvim',
    lazy = false,
    dependencies = { { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font } },
    keys = {
      { '-', '<cmd>Oil<CR>', desc = 'Open parent directory' },
      { '<leader>o', '<cmd>Oil --float<CR>', desc = 'Open Oil float' },
    },
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      default_file_explorer = true,
      columns = { 'icon' },
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 2,
        max_width = 0.9,
        max_height = 0.9,
        border = 'rounded',
      },
    },
  },
  {
    'cbochs/grapple.nvim',
    dependencies = { { 'nvim-tree/nvim-web-devicons', lazy = true, enabled = vim.g.have_nerd_font } },
    cmd = 'Grapple',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      scope = 'git',
      icons = vim.g.have_nerd_font,
      style = 'basename',
    },
    keys = {
      {
        '<leader>m',
        function()
          require('grapple').toggle()
        end,
        desc = 'Toggle Grapple tag',
      },
      {
        '<leader>M',
        function()
          require('grapple').toggle_tags()
        end,
        desc = 'Open Grapple tags',
      },
      {
        '<leader>1',
        function()
          require('grapple').select { index = 1 }
        end,
        desc = 'Grapple tag 1',
      },
      {
        '<leader>2',
        function()
          require('grapple').select { index = 2 }
        end,
        desc = 'Grapple tag 2',
      },
      {
        '<leader>3',
        function()
          require('grapple').select { index = 3 }
        end,
        desc = 'Grapple tag 3',
      },
      {
        '<leader>4',
        function()
          require('grapple').select { index = 4 }
        end,
        desc = 'Grapple tag 4',
      },
      {
        '<leader>[',
        function()
          require('grapple').cycle_tags 'prev'
        end,
        desc = 'Previous Grapple tag',
      },
      {
        '<leader>]',
        function()
          require('grapple').cycle_tags 'next'
        end,
        desc = 'Next Grapple tag',
      },
    },
  },
  {
    'hedyhli/outline.nvim',
    cmd = { 'Outline', 'OutlineOpen' },
    keys = {
      { '<leader>so', '<cmd>Outline<CR>', desc = '[S]ymbol [O]utline' },
    },
    opts = {
      outline_window = {
        position = 'right',
        width = 22,
        relative_width = false,
        focus_on_open = false,
      },
      outline_items = {
        show_symbol_lineno = true,
      },
      preview_window = {
        border = 'rounded',
      },
      symbol_folding = {
        autofold_depth = 2,
      },
    },
  },
  {
    'XXiaoA/atone.nvim',
    cmd = 'Atone',
    keys = {
      { '<leader>u', '<cmd>Atone toggle<CR>', desc = 'Toggle undo tree' },
    },
    opts = {
      layout = {
        direction = 'left',
        width = 0.25,
      },
      ui = {
        border = 'rounded',
        compact = true,
      },
    },
  },
}
