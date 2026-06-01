-- Drop: falling particles animation on alpha/dashboard buffers
return {
  {
    'folke/drop.nvim',
    event = 'VeryLazy',
    opts = {
      theme = 'stars', -- options: stars, leaves, snow, xmas, spring, summer
      max = 40,
      interval = 150,
      screensaver = 1000 * 60 * 5, -- show after 5 min idle (false to disable)
      filetypes = { 'dashboard', 'alpha', 'starter' },
    },
  },
}
