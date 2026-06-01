-- Fidget: LSP progress UI
-- basedpyright sends dozens of $/progress events per keystroke (background
-- analysis). Suppress them entirely using progress.ignore.
return {
  'j-hui/fidget.nvim',
  opts = {
    progress = {
      -- Ignore these LSP servers entirely — no progress shown for them
      ignore = { 'basedpyright', 'pyright' },
      -- Hide "done" notifications instantly for everything else
      display = {
        done_ttl = 0,
        skip_history = true,
      },
    },
  },
}
