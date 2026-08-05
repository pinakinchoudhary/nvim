return {
  'vinvolve/data-preview.nvim',
  cmd = { 'DataPreview', 'DataPreviewStats' },
  config = function()
    local data_preview = require 'data-preview'
    vim.api.nvim_create_user_command('DataPreview', data_preview.preview, {
      nargs = 0,
      desc = 'Preview data file (Parquet, Avro)',
    })
    vim.api.nvim_create_user_command('DataPreviewStats', data_preview.preview_stats, {
      nargs = 0,
      desc = 'Preview data file statistics (min, max, nulls, etc.)',
    })
  end,
}
