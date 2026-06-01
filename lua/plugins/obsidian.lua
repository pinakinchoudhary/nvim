-- Obsidian.nvim — Salar's superior setup, adapted to use snacks.nvim as picker
-- Multi-workspace detection (env vars + .obsidian folder traversal)
-- Daily notes, templates, custom note IDs, frontmatter, datetime patching

return {
  'obsidian-nvim/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = 'markdown',
  cmd = {
    'ObsidianBacklinks',
    'ObsidianDailies',
    'ObsidianExtractNote',
    'ObsidianFollowLink',
    'ObsidianLink',
    'ObsidianLinkNew',
    'ObsidianLinks',
    'ObsidianNew',
    'ObsidianNewFromTemplate',
    'ObsidianOpen',
    'ObsidianPasteImg',
    'ObsidianQuickSwitch',
    'ObsidianRename',
    'ObsidianSearch',
    'ObsidianTags',
    'ObsidianTemplate',
    'ObsidianToday',
    'ObsidianToggleCheckbox',
    'ObsidianTomorrow',
    'ObsidianTOC',
    'ObsidianYesterday',
    'ObsidianWorkspace',
  },
  -- Also trigger on your vault path (kept from original config)
  event = {
    'BufReadPre ' .. vim.fn.expand '~' .. '/Library/Mobile Documents/iCloud~md~obsidian/Documents/success/**.md',
    'BufNewFile ' .. vim.fn.expand '~' .. '/Library/Mobile Documents/iCloud~md~obsidian/Documents/success/**.md',
  },
  keys = {
    { '<leader>ob', '<cmd>ObsidianBacklinks<CR>', desc = 'Obsidian backlinks' },
    { '<leader>od', '<cmd>ObsidianToday<CR>', desc = 'Obsidian daily note' },
    { '<leader>ol', '<cmd>ObsidianLinks<CR>', desc = 'Obsidian note links' },
    { '<leader>oo', '<cmd>ObsidianOpen<CR>', desc = 'Open in Obsidian app' },
    { '<leader>oq', '<cmd>ObsidianQuickSwitch<CR>', desc = 'Obsidian quick switch' },
    { '<leader>os', '<cmd>ObsidianSearch<CR>', desc = 'Search Obsidian notes' },
    { '<leader>ot', '<cmd>ObsidianTemplate<CR>', desc = 'Insert Obsidian template' },
    { '<leader>oT', '<cmd>ObsidianTOC<CR>', desc = 'Obsidian table of contents' },
    { '<leader>on', '<cmd>ObsidianNew<CR>', desc = 'Obsidian new note' },
    { '<leader>ow', '<cmd>ObsidianWorkspace<CR>', desc = 'Switch Obsidian workspace' },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'folke/snacks.nvim',
  },
  init = function()
    local group = vim.api.nvim_create_augroup('obsidian-markdown', { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
      group = group,
      pattern = 'markdown',
      callback = function(args)
        require('core.obsidian').setup_markdown_buffer(args.buf)
      end,
    })
  end,
  opts = function()
    return require('core.obsidian').opts()
  end,
  config = function(_, opts)
    require('obsidian').setup(opts)
    require('core.obsidian').patch_template_substitutions()
  end,
}
