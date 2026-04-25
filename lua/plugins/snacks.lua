return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true, timeout = 3000 },
      quickfile = { enabled = true },
      scope = {
        enabled = true,
        -- Disable treesitter scope for markdown
        filter = function(buf)
          return vim.bo[buf].filetype ~= 'markdown' and vim.bo[buf].filetype ~= 'markdown_inline'
        end,
      },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      picker = { enabled = true },
      image = { enabled = false },
      scroll = { enabled = true },
      indent = {
        enabled = true,
        animate = { enabled = false },
        scope = { enabled = true },
        -- Disable indent for markdown
        filter = function(buf)
          local ft = vim.bo[buf].filetype
          return ft ~= 'markdown' and ft ~= 'markdown_inline'
        end,
      },
      dim = { enabled = false },
      terminal = {
        enabled = true,
        win = { border = 'rounded' },
      },
      zen = { enabled = true },
      styles = {
        notification = {
          wo = { wrap = true },
        },
      },
    },
    keys = {
      {
        '<leader>s',
        function()
          Snacks.picker.smart()
        end,
        desc = 'Search files',
      },
      {
        '<leader>sf',
        function()
          Snacks.picker.files()
        end,
        desc = 'Search files',
      },
      {
        '<leader>sg',
        function()
          Snacks.picker.grep()
        end,
        desc = 'Search by grep',
      },
      {
        '<leader>p',
        function()
          Snacks.picker.smart()
        end,
        desc = 'Smart find files',
      },
      {
        '<leader>,',
        function()
          Snacks.picker.buffers()
        end,
        desc = 'Buffers',
      },
      {
        '<leader>:',
        function()
          Snacks.picker.command_history()
        end,
        desc = 'Command history',
      },
      {
        '<leader>n',
        function()
          Snacks.picker.notifications()
        end,
        desc = 'Notification history',
      },
      {
        '<leader>z',
        function()
          Snacks.zen()
        end,
        desc = 'Toggle Zen mode',
      },
      {
        '<leader>tt',
        function()
          Snacks.terminal.toggle(vim.o.shell, {
            win = {
              border = 'rounded',
              width = 0.9,
              height = 0.85,
            },
          })
        end,
        desc = '[T]oggle floating [T]erminal',
      },
    },
    init = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'VeryLazy',
        callback = function()
          -- Force-disable Treesitter in Snacks Picker Previews for Markdown
          local ok, Preview = pcall(require, 'snacks.picker.core.preview')
          if ok then
            local original_highlight = Preview.highlight
            function Preview:highlight(opts)
              opts = opts or {}
              local ft = opts.ft
              if not ft and (opts.file or opts.buf) then
                ft = vim.filetype.match({
                  buf = opts.buf or self.win.buf,
                  filename = opts.file,
                })
              end

              if ft == 'markdown' or ft == 'markdown_inline' then
                -- Kill any treesitter instance on this buffer immediately
                pcall(vim.treesitter.stop, self.win.buf)
                -- Fallback to regex-based syntax highlighting
                vim.bo[self.win.buf].syntax = 'markdown'
                return
              end
              return original_highlight(self, opts)
            end
          end

          Snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>tw'
          Snacks.toggle.option('spell', { name = 'Spell' }):map '<leader>ts'
          Snacks.toggle.diagnostics():map '<leader>td'
          Snacks.toggle.inlay_hints():map '<leader>th'
          Snacks.toggle.indent():map '<leader>ti'
          Snacks.toggle.dim():map '<leader>tz'
          Snacks.toggle.line_number():map '<leader>tn'
          Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>tr'
        end,
      })
    end,
  },
}
