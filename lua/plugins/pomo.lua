return {
  'epwalsh/pomo.nvim',
  version = '*',
  lazy = true,
  cmd = { 'TimerStart', 'TimerRepeat', 'TimerStop', 'TimerPause', 'TimerResume', 'Pomo', 'PomoBreak', 'PomoStatus' },

  opts = {
    update_interval = 1000,

    notifiers = {
      {
        init = function(timer)
          local n = { last_remaining = nil }

          -- Format seconds -> "MM:SS"
          local function fmt(secs)
            if not secs then
              return '?'
            end
            return ('%d:%02d'):format(math.floor(secs / 60), secs % 60)
          end

          function n:start()
            vim.notify(('󱎫  %s'):format(timer.name), vim.log.levels.INFO, { title = 'Pomodoro started', timeout = 3000 })
          end

          function n:tick(time_left)
            self.last_remaining = time_left -- track so pause/stop can report it
          end

          function n:done()
            vim.notify(('✓  %s complete!'):format(timer.name), vim.log.levels.WARN, { title = '󱎫 Pomodoro', timeout = 15000 })
          end

          function n:stop()
            vim.notify(
              ('✗  %s stopped · %s remaining'):format(timer.name, fmt(self.last_remaining)),
              vim.log.levels.INFO,
              { title = 'Pomodoro stopped', timeout = 4000 }
            )
          end

          function n:pause()
            vim.notify(
              ('⏸  %s paused · %s remaining'):format(timer.name, fmt(self.last_remaining)),
              vim.log.levels.INFO,
              { title = 'Pomodoro paused', timeout = 4000 }
            )
          end

          function n:resume()
            vim.notify(
              ('▶  %s resumed · %s remaining'):format(timer.name, fmt(self.last_remaining)),
              vim.log.levels.INFO,
              { title = 'Pomodoro resumed', timeout = 3000 }
            )
          end

          return n
        end,
      },
    },
  },

  config = function(_, opts)
    require('pomo').setup(opts)

    -- :Pomo [minutes] [name]   — default: 25m Work
    vim.api.nvim_create_user_command('Pomo', function(args)
      local parts = vim.split(args.args, '%s+', { trimempty = true })
      local duration = parts[1] or '25'
      local name = parts[2] or 'Work'
      vim.cmd(('TimerStart %sm %s'):format(duration, name))
    end, { nargs = '*', desc = 'Start pomodoro  e.g. :Pomo 45 DeepWork' })

    -- :PomoBreak [minutes]     — default: 5m
    vim.api.nvim_create_user_command('PomoBreak', function(args)
      local duration = args.args ~= '' and args.args or '5'
      vim.cmd(('TimerStart %sm Break'):format(duration))
    end, { nargs = '?', desc = 'Start break  e.g. :PomoBreak 15' })

    -- :PomoStatus              — peek at the first-to-finish timer, auto-hides
    vim.api.nvim_create_user_command('PomoStatus', function()
      local ok, pomo = pcall(require, 'pomo')
      if not ok then
        return
      end
      local t = pomo.get_first_to_finish()
      vim.notify(t and tostring(t) or 'No active timer', vim.log.levels.INFO, { title = '󱎫 Pomodoro', timeout = 3000 })
    end, { desc = 'Show remaining time' })
  end,
}
