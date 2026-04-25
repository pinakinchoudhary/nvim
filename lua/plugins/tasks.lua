return {
  {
    'stevearc/overseer.nvim',
    cmd = { 'OverseerRun', 'OverseerToggle', 'OverseerQuickAction', 'OverseerTaskAction' },
    keys = {
      { '<leader>or', '<cmd>OverseerRun<CR>', desc = '[O]verseer [R]un task' },
      { '<leader>ot', '<cmd>OverseerToggle<CR>', desc = '[O]verseer [T]oggle tasks' },
      { '<leader>oa', '<cmd>OverseerTaskAction<CR>', desc = '[O]verseer task [A]ction' },
    },
    opts = {
      task_list = {
        direction = 'bottom',
        min_height = 12,
        max_height = 18,
        default_detail = 1,
      },
      templates = { 'builtin' },
    },
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-go',
    },
    cmd = 'Neotest',
    keys = {
      {
        '<leader>nr',
        function()
          require('neotest').run.run()
        end,
        desc = '[N]eotest [R]un nearest',
      },
      {
        '<leader>nf',
        function()
          require('neotest').run.run(vim.fn.expand '%')
        end,
        desc = '[N]eotest run [F]ile',
      },
      {
        '<leader>na',
        function()
          require('neotest').run.run(vim.uv.cwd())
        end,
        desc = '[N]eotest run [A]ll',
      },
      {
        '<leader>nd',
        function()
          require('neotest').run.run { strategy = 'dap' }
        end,
        desc = '[N]eotest [D]ebug nearest',
      },
      {
        '<leader>ns',
        function()
          require('neotest').run.stop()
        end,
        desc = '[N]eotest [S]top',
      },
      {
        '<leader>no',
        function()
          require('neotest').output.open { enter = true, auto_close = true }
        end,
        desc = '[N]eotest [O]utput',
      },
      {
        '<leader>nO',
        function()
          require('neotest').output_panel.toggle()
        end,
        desc = '[N]eotest output panel',
      },
      {
        '<leader>nv',
        function()
          require('neotest').summary.toggle()
        end,
        desc = '[N]eotest summary',
      },
    },
    opts = function()
      local neotest_ns = vim.api.nvim_create_namespace 'neotest'
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            return diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
          end,
        },
      }, neotest_ns)

      return {
        adapters = {
          require 'neotest-go' {
            experimental = {
              test_table = true,
            },
            args = { '-count=1', '-timeout=60s' },
          },
        },
        output = {
          open_on_run = true,
        },
      }
    end,
  },
}
