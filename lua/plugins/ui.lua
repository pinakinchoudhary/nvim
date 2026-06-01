-- UI plugins: koda (default) + full colorscheme collection + todo-comments
-- Salar's exact default theme is "koda" (oskarnurm/koda.nvim)
-- Switch with :Theme, :ThemeNext, :ThemePrev  |  <leader>Ts/Tn/Tp

local colorschemes = require 'core.colorschemes'

-- Build lazy specs for every colorscheme repo (all lazy except koda)
local colorscheme_specs = vim.tbl_map(function(item)
  local spec = {
    item.repo,
    lazy = true,
    priority = 1000,
  }
  if item.name then
    spec.name = item.name
  end
  return spec
end, colorschemes.items)

-- koda is the primary: load eagerly, run theme.setup() from here
local koda_init = {
  'oskarnurm/koda.nvim',
  lazy = false,
  priority = 1001,
  config = function()
    -- theme.setup() loads persisted theme (or koda as fallback)
    require('core.theme').setup { default = 'koda' }
  end,
}

-- Build final spec list: koda_init first, then all others (skip koda repo since koda_init covers it)
local specs = { koda_init }
for _, spec in ipairs(colorscheme_specs) do
  local repo = type(spec[1]) == 'string' and spec[1] or ''
  if repo ~= 'oskarnurm/koda.nvim' then
    table.insert(specs, spec)
  end
end

-- todo-comments
table.insert(specs, {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = false },
})

return specs
