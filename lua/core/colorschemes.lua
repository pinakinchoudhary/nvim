-- All available colorscheme repos and their scheme names
-- Adapted from Salar's config — koda is first and the default
local M = {}

M.items = {
  {
    repo = 'oskarnurm/koda.nvim',
    schemes = { 'koda', 'koda-dark', 'koda-light', 'koda-glade', 'koda-moss' },
  },
  {
    repo = 'catppuccin/nvim',
    name = 'catppuccin',
    schemes = {
      'catppuccin',
      'catppuccin-latte',
      'catppuccin-frappe',
      'catppuccin-macchiato',
      'catppuccin-mocha',
    },
  },
  {
    repo = 'folke/tokyonight.nvim',
    schemes = {
      'tokyonight',
      'tokyonight-night',
      'tokyonight-storm',
      'tokyonight-day',
      'tokyonight-moon',
    },
  },
  {
    repo = 'rose-pine/neovim',
    name = 'rose-pine',
    schemes = { 'rose-pine', 'rose-pine-main', 'rose-pine-moon', 'rose-pine-dawn' },
  },
  {
    repo = 'rebelot/kanagawa.nvim',
    schemes = { 'kanagawa', 'kanagawa-wave', 'kanagawa-dragon', 'kanagawa-lotus' },
  },
  {
    repo = 'ellisonleao/gruvbox.nvim',
    schemes = { 'gruvbox' },
  },
  {
    repo = 'EdenEast/nightfox.nvim',
    schemes = { 'nightfox', 'dayfox', 'dawnfox', 'duskfox', 'nordfox', 'terafox', 'carbonfox' },
  },
  {
    repo = 'sainnhe/everforest',
    schemes = { 'everforest' },
  },
  {
    repo = 'sainnhe/sonokai',
    schemes = { 'sonokai' },
  },
  {
    repo = 'navarasu/onedark.nvim',
    schemes = { 'onedark' },
  },
  {
    repo = 'shaunsingh/nord.nvim',
    schemes = { 'nord' },
  },
  {
    repo = 'Mofiqul/dracula.nvim',
    schemes = { 'dracula', 'dracula-soft' },
  },
  {
    repo = 'projekt0n/github-nvim-theme',
    schemes = {
      'github_dark',
      'github_dark_default',
      'github_dark_dimmed',
      'github_dark_high_contrast',
      'github_light',
      'github_light_default',
      'github_light_high_contrast',
    },
  },
  {
    repo = 'nyoom-engineering/oxocarbon.nvim',
    schemes = { 'oxocarbon' },
  },
}

function M.names()
  local names = {}
  for _, item in ipairs(M.items) do
    vim.list_extend(names, item.schemes)
  end
  return names
end

return M
