# Neovim Inventory

Current active setup after pruning overlapping tools.

## Core

- `init.lua` sets space leader, enables Nerd Font icons, and loads `utils.lazy`, `core.options`, `core.keymaps`, `core.autocmds`, and `plugins`.
- Options enable line numbers, relative numbers, mouse, OSC52 clipboard, `termguicolors`, rounded borders, persistent undo, smart search, stable split behavior, whitespace display, cursorline, scroll margins, hidden buffers, and confirmation prompts.
- Core keymaps cover diagnostics, quickfix/location-list movement, terminal escape, insert `jk` escape, split navigation, word replacement, and Neogit.

## Plugin Imports

- `plugins.lsp` (includes `blink.cmp`, `conform.nvim`)
- `plugins.treesitter`
- `plugins.ui` (includes `catppuccin`, `todo-comments`)
- `plugins.debug`
- `plugins.misc` (includes `which-key`, `mini.nvim`, `guess-indent`)
- `plugins.autopairs`
- `plugins.gitsigns`
- `plugins.lint`
- `plugins.flash`
- `plugins.fidget`
- `plugins.vim-tpipeline`
- `plugins.vim-tmux-navigator`
- `plugins.move`
- `plugins.neogit`
- `plugins.snacks`
- `plugins.navigation` (includes `oil`, `grapple`, `outline`, `atone`)
- `plugins.tasks` (includes `overseer`, `neotest`)
- `plugins.quickfix` (includes `quicker`)
- `plugins.render-markdown`
- `plugins.noice`
- `plugins.obsidian`
- `plugins.pomo`

## Deliberately Removed

- Telescope: replaced by Snacks picker.
- Neo-tree: replaced by Oil for directory buffers and file operations.
- FTerm: replaced by Snacks terminal.
- Tabout: removed to avoid overlap with Blink/LuaSnip/autopairs.
- Indent-blankline: replaced by Snacks indent.
- Standalone nvim-notify: replaced by Snacks notifier.

## Search, UI, And QoL

- `folke/snacks.nvim`
  - Central UX layer.
  - Enabled: bigfile, input, notifier, quickfile, statuscolumn, words, picker, scroll, indent, terminal, zen, scope.
- `catppuccin/nvim`
  - Main colorscheme, transparent core/Oil highlights.
- `folke/todo-comments.nvim`
  - Todo highlighting without signs.
- `folke/flash.nvim`
  - In-buffer jump/search.
- `j-hui/fidget.nvim`
  - LSP progress UI.
- `folke/noice.nvim`
  - UI for messages, cmdline and popupmenu.

## Files And Navigation

- `stevearc/oil.nvim`
  - Owns directory buffers, including `nvim .`.
- `cbochs/grapple.nvim`
  - Project-scoped file tags.
- `hedyhli/outline.nvim`
  - LSP/markdown symbol outline.
- `XXiaoA/atone.nvim`
  - Undo tree visualizer.

## LSP, Completion, Formatting

- `folke/lazydev.nvim`
  - Lua development support for Neovim config/plugin code.
- `neovim/nvim-lspconfig`
  - Mason-backed LSP setup with Blink capabilities.
- `saghen/blink.cmp`
  - Completion engine with LuaSnip snippets and lazydev source.
- `L3MON4D3/LuaSnip`
  - Snippet engine.
- `stevearc/conform.nvim`
  - Formatter; Lua uses `stylua`.
- `mfussenegger/nvim-lint`
  - Linting with `markdownlint`.

## Editing

- `nvim-treesitter/nvim-treesitter`
  - Highlighting and indentation.
- `windwp/nvim-autopairs`
  - Pair insertion.
- `fedepujol/move.nvim`
  - Move lines and visual blocks.
- `echasnovski/mini.nvim`
  - `mini.ai`, `mini.surround`, and `mini.statusline`.
- `NMAC427/guess-indent.nvim`
  - Indentation detection.

## Git

- `lewis6991/gitsigns.nvim`
  - Git signs and hunk operations.
- `NeogitOrg/neogit`
  - Git interface.

## Tasks, Tests, Debugging

- `mfussenegger/nvim-dap` & `rcarriga/nvim-dap-ui`
- `stevearc/overseer.nvim`
  - Task runner.
- `nvim-neotest/neotest`
  - Test runner.

## Quickfix

- `stevearc/quicker.nvim`
  - Quickfix and location list enhancement.

## Notes & Productivity

- `epwalsh/obsidian.nvim`
  - Obsidian vault integration.
- `epwalsh/pomo.nvim`
  - Pomodoro timer.
- `MeanderingProgrammer/render-markdown.nvim`
  - Markdown rendering in Neovim.
