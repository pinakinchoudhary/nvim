# Neovim Inventory

Current active setup. Last updated: 2026-08-03 (v3 — decluttered: obsidian/nvim-tree/tpipeline/noice/tabout/lint/drop removed).

## Core

- `init.lua` sets space leader, enables Nerd Font icons, and loads `utils.lazy`, `core.options`, `core.keymaps`, `core.autocmds`, and `plugins`.
- Options enable line numbers, relative numbers, mouse, OSC52 clipboard, `termguicolors`, rounded borders, persistent undo, smart search, stable split behavior, whitespace display, cursorline, scroll margins, hidden buffers, and confirmation prompts.
- Core keymaps cover diagnostics, quickfix/location-list movement, terminal escape, insert `jk` escape, split navigation/resize, word replacement, Neogit, scroll centering, and theme switching.

## Plugin Imports

- `plugins.lsp` (includes `blink.cmp`, `conform.nvim`)
- `plugins.treesitter`
- `plugins.ui` (colorscheme system: koda default + 13 more themes + `:Theme` commands + `todo-comments`)
- `plugins.debug`
- `plugins.misc` (includes `which-key`, `mini.nvim` ai+surround, `guess-indent`)
- `plugins.autopairs`
- `plugins.gitsigns`
- `plugins.flash`
- `plugins.fidget`
- `plugins.vim-tmux-navigator`
- `plugins.move`
- `plugins.neogit`
- `plugins.snacks`
- `plugins.navigation` (includes `oil`, `grapple`, `outline`, `atone`)
- `plugins.tasks` (includes `overseer`, `neotest`)
- `plugins.quickfix` (includes `quicker`)
- `plugins.render-markdown`
- `plugins.smear_cursor` (cursor smear animation — from Salar)
- `plugins.lualine` (statusline — from Salar)
- `plugins.satellite` (scrollbar — from Salar)
- `plugins.parquet` (`data-preview.nvim`)
- `plugins.dressing` (enhanced `vim.ui.select` — from Salar)

## Deliberately Removed

- Telescope: replaced by Snacks picker.
- Neo-tree / nvim-tree: sidebar removed, Oil owns directory buffers — v3.
- FTerm: replaced by Snacks terminal.
- Obsidian: removed entirely (core + plugin) — v3.
- vim-tpipeline: removed (tmux statusline collided with lualine, doubled the task bar) — v3.
- noice.nvim: removed (duplicated Snacks notifier, heavy cmdline UI) — v3.
- tabout.nvim: removed (blink.cmp preset already handles snippet Tab) — v3.
- nvim-lint: removed (only linter was markdownlint, but markdown diagnostics are disabled) — v3.
- drop.nvim: removed (no dashboard plugin exists, so it never ran) — v3.
- Indent-blankline: replaced by Snacks indent.
- Standalone nvim-notify: replaced by Snacks notifier.
- `mini.statusline`: replaced by lualine.
- AutoPairsJump binding: removed (non-functional stale reference).
- nvim-cmp: removed (obsolete; blink.cmp is the completion engine).
- Lazy.nvim update checker: disabled (no background git fetch).

## Search, UI, And QoL

- `folke/snacks.nvim`
  - Central UX layer.
  - Enabled: bigfile, input, notifier, quickfile, picker, indent, terminal, zen, scope.
  - Disabled: statuscolumn (forced off in options), words, scroll (satellite covers it), dim, image.
- **Colorscheme system** (adapted from Salar's config)
  - `:Theme` — fuzzy-pick from 30+ schemes via `vim.ui.select` (dressing-enhanced)
  - `:ThemeNext` / `:ThemePrev` — cycle themes; persisted to `~/.local/state/nvim/theme.txt`
  - Keymaps: `<leader>Ts` select, `<leader>Tn` next, `<leader>Tp` prev
  - Default: `koda` (transparent background preserved on every switch)
  - All schemes lazy-loaded: koda, catppuccin, tokyonight, rose-pine, kanagawa, gruvbox, nightfox, everforest, sonokai, onedark, nord, dracula, github-nvim-theme, oxocarbon
- `folke/todo-comments.nvim`
  - Todo highlighting without signs.
- `folke/flash.nvim`
  - In-buffer jump/search.
- `j-hui/fidget.nvim`
  - LSP progress UI.
- `sphamba/smear-cursor.nvim` *(from Salar)*
  - Animated cursor smear with tuned stiffness/damping.
- `lewis6991/satellite.nvim` *(from Salar)*
  - Decorative right-side scrollbar showing diagnostics, marks, search matches.
- `stevearc/dressing.nvim` *(from Salar)*
  - Enhanced `vim.ui.select` (snacks handles `vim.ui.input`).

## Files And Navigation

- `stevearc/oil.nvim`
  - Owns directory buffers, including `nvim .`. Keys: `-` (open parent), `<leader>o` (float).
- `cbochs/grapple.nvim`
  - Project-scoped file tags.
- `hedyhli/outline.nvim`
  - LSP/markdown symbol outline.
- `XXiaoA/atone.nvim`
  - Undo tree visualizer.

## Statusline

- `nvim-lualine/lualine.nvim` *(from Salar)*
  - Statusline with `globalstatus`, branch/diff/diagnostics, lazy update count. Auto-syncs on theme change.

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

## Editing

- `nvim-treesitter/nvim-treesitter`
  - Highlighting and indentation.
- `windwp/nvim-autopairs`
  - Pair insertion.
- `fedepujol/move.nvim`
  - Move lines and visual blocks.
- `echasnovski/mini.nvim`
  - `mini.ai`, `mini.surround`.
- `NMAC427/guess-indent.nvim`
  - Indentation detection.

## Keymaps Added From Salar

| Key | Action |
|-----|--------|
| `<leader>wv/wh/we/wx` | Split vertical/horizontal/equal/close |
| `<C-Up/Down>` | Resize window height |
| `<C-Left/Right>` | Resize window width |
| `<C-u>/<C-d>` | Scroll half-page + center cursor (zz) |
| `<leader>Ts/Tn/Tp` | Theme select/next/prev |

## Git

- `lewis6991/gitsigns.nvim`
  - Git signs and hunk operations.
- `NeogitOrg/neogit`
  - Git interface. Key: `<leader>gg`

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

- `MeanderingProgrammer/render-markdown.nvim`
  - Markdown rendering in Neovim.
