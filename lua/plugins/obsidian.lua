return {
  'obsidian-nvim/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  cmd = {
    'ObsidianOpen',
    'ObsidianNew',
    'ObsidianQuickSwitch',
    'ObsidianFollowLink',
    'ObsidianBacklinks',
    'ObsidianTags',
    'ObsidianToday',
    'ObsidianYesterday',
    'ObsidianTomorrow',
    'ObsidianDailies',
    'ObsidianTemplate',
    'ObsidianSearch',
    'ObsidianLink',
    'ObsidianLinkNew',
    'ObsidianLinks',
    'ObsidianExtractNote',
    'ObsidianWorkspace',
    'ObsidianPasteImg',
    'ObsidianRename',
    'ObsidianToggleCheckbox',
    'ObsidianNewFromTemplate',
    'ObsidianTOC',
  },
  event = {
    'BufReadPre ' .. vim.fn.expand '~' .. '/Library/Mobile Documents/iCloud~md~obsidian/Documents/Obsidian/**.md',
    'BufNewFile ' .. vim.fn.expand '~' .. '/Library/Mobile Documents/iCloud~md~obsidian/Documents/Obsidian/**.md',
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'folke/snacks.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'personal',
        path = '/Users/pinakinchoudhary/Library/Mobile Documents/iCloud~md~obsidian/Documents/Obsidian/',
      },
    },
    completion = {
      nvim_cmp = false,
      blink = true,
      min_chars = 2,
    },
    picker = {
      name = 'snacks.nvim',
    },
    legacy_commands = false,
    ui = {
      enable = false,
    },
  },
}
