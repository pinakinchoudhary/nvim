return {
  {
    'stevearc/quicker.nvim',
    ft = 'qf',
    keys = {
      {
        '<leader>qq',
        function()
          require('quicker').toggle()
        end,
        desc = 'Toggle quickfix',
      },
      {
        '<leader>ql',
        function()
          require('quicker').toggle { loclist = true }
        end,
        desc = 'Toggle location list',
      },
    },
    ---@module 'quicker'
    ---@type quicker.SetupOptions
    opts = {
      opts = {
        number = false,
        relativenumber = false,
        signcolumn = 'auto',
        wrap = false,
      },
      edit = {
        enabled = true,
        autosave = 'unmodified',
      },
      keys = {
        {
          '>',
          function()
            require('quicker').expand()
          end,
          desc = 'Expand quickfix context',
        },
        {
          '<',
          function()
            require('quicker').collapse()
          end,
          desc = 'Collapse quickfix context',
        },
      },
    },
  },
}
