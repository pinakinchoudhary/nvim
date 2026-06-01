# Neovim Inventory

Current active setup. Last updated: 2026-06-01 (v2 — koda default, bufferline removed).

## Core

- `init.lua` sets space leader, enables Nerd Font icons, and loads `utils.lazy`, `core.options`, `core.keymaps`, `core.autocmds`, and `plugins`.
- Options enable line numbers, relative numbers, mouse, OSC52 clipboard, `termguicolors`, rounded borders, persistent undo, smart search, stable split behavior, whitespace display, cursorline, scroll margins, hidden buffers, and confirmation prompts.
- Core keymaps cover diagnostics, quickfix/location-list movement, terminal escape, insert `jk` escape, split navigation/resize, word replacement, Neogit, scroll centering, and theme switching.

## Plugin Imports

- `plugins.lsp` (includes `blink.cmp`, `conform.nvim`)
- `plugins.treesitter`
- `plugins.ui` (colorscheme system: catppuccin default + 12 more themes + `:Theme` commands + `todo-comments`)
- `plugins.debug`
- `plugins.misc` (includes `which-key`, `mini.nvim` ai+surround, `guess-indent`)
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
- `plugins.nvim_tree` (nvim-tree sidebar — from Salar)
- `plugins.tasks` (includes `overseer`, `neotest`)
- `plugins.quickfix` (includes `quicker`)
- `plugins.render-markdown`
- `plugins.noice`
- `plugins.obsidian` (Salar's superior setup — from `core.obsidian`)
- `plugins.tabout`
- `plugins.smear_cursor` (cursor smear animation — from Salar)
- `plugins.bufferline` (buffer tabs — from Salar)
- `plugins.lualine` (statusline — from Salar)
- `plugins.satellite` (scrollbar — from Salar)
- `plugins.drop` (falling particles on dashboard — from Salar)
- `plugins.dressing` (enhanced `vim.ui.select` — from Salar)

## Deliberately Removed

- Telescope: replaced by Snacks picker.
- Neo-tree: replaced by Oil for directory buffers; nvim-tree added as sidebar.
- FTerm: replaced by Snacks terminal.
- Tabout: removed to avoid overlap with Blink/LuaSnip/autopairs.
- Indent-blankline: replaced by Snacks indent.
- Standalone nvim-notify: replaced by Snacks notifier.
- `pomo.nvim`: removed.
- `mini.statusline`: replaced by lualine.
- AutoPairsJump binding: removed (non-functional stale reference).

## Search, UI, And QoL

- `folke/snacks.nvim`
  - Central UX layer.
  - Enabled: bigfile, input, notifier, quickfile, statuscolumn, words, picker, scroll, indent, terminal, zen, scope.
- **Colorscheme system** (adapted from Salar's config)
  - `:Theme` — fuzzy-pick from 30+ schemes via `vim.ui.select` (dressing-enhanced)
  - `:ThemeNext` / `:ThemePrev` — cycle themes; persisted to `~/.local/state/nvim/theme.txt`
  - Keymaps: `<leader>Ts` select, `<leader>Tn` next, `<leader>Tp` prev
  - Default: `catppuccin` (transparent background preserved on every switch)
  - All schemes lazy-loaded: catppuccin, tokyonight, rose-pine, kanagawa, gruvbox, nightfox, everforest, sonokai, onedark, nord, dracula, github-nvim-theme, oxocarbon
- `folke/todo-comments.nvim`
  - Todo highlighting without signs.
- `folke/flash.nvim`
  - In-buffer jump/search.
- `j-hui/fidget.nvim`
  - LSP progress UI.
- `folke/noice.nvim`
  - UI for messages, cmdline and popupmenu.
- `sphamba/smear-cursor.nvim` *(from Salar)*
  - Animated cursor smear with tuned stiffness/damping.
- `folke/drop.nvim` *(from Salar)*
  - Falling particles (stars) animation on dashboard/alpha buffers; screensaver after 5 min.
- `lewis6991/satellite.nvim` *(from Salar)*
  - Decorative right-side scrollbar showing diagnostics, marks, search matches.
- `stevearc/dressing.nvim` *(from Salar)*
  - Enhanced `vim.ui.select` (snacks handles `vim.ui.input`).

## Files And Navigation

- `stevearc/oil.nvim`
  - Owns directory buffers, including `nvim .`. Keys: `-` (open parent), `<leader>o` (float).
- `nvim-tree/nvim-tree.lua` *(from Salar)*
  - Sidebar file explorer. Keys: `<C-n>` toggle, `<leader>e` focus.
  - Coexists with oil: nvim-tree = sidebar browsing/looks, oil = productivity edits.
- `cbochs/grapple.nvim`
  - Project-scoped file tags.
- `hedyhli/outline.nvim`
  - LSP/markdown symbol outline.
- `XXiaoA/atone.nvim`
  - Undo tree visualizer.

## Statusline & Bufferline

- `nvim-lualine/lualine.nvim` *(from Salar)*
  - Statusline with `globalstatus`, branch/diff/diagnostics, lazy update count. Auto-syncs on theme change.
- `akinsho/bufferline.nvim` *(from Salar)*
  - Buffer tabs at the top. Theme-aware highlights synced on every colorscheme change.
  - Keys: `<Tab>` next buffer, `<S-Tab>` prev, `<leader>x` close, `<leader>bh/bl` move buffer.

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
| `<C-n>` | Toggle nvim-tree sidebar |
| `<leader>e` | Focus nvim-tree sidebar |
| `<Tab>/<S-Tab>` | Next/prev buffer (bufferline) |
| `<leader>x` | Close current buffer |
| `<leader>bh/bl` | Move buffer left/right |
| `<leader>ob/od/ol/oo/oq/os/ot/oT/on/ow` | Obsidian commands |
| `<leader>oc` | Toggle Obsidian checkbox (in markdown) |

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

- `obsidian-nvim/obsidian.nvim` *(Salar's superior config, adapted)*
  - Multi-workspace detection: env vars `OBSIDIAN_VAULT_PERSONAL`/`OBSIDIAN_VAULT_WORK` + `.obsidian` folder auto-detection.
  - Default workspace: your iCloud vault at `~/Library/Mobile Documents/iCloud~md~obsidian/Documents/success/`.
  - Daily notes in `notes/dailies/`, templates in `templates/`, custom note IDs with datetime slugs.
  - Obsidian `{{date:FORMAT}}` template syntax translated to Lua strftime.
  - Picker: snacks.nvim. Completion: blink.cmp.
  - Buffer settings on enter: `wrap`, `linebreak`, `conceallevel=2`, `textwidth=100`.
- `MeanderingProgrammer/render-markdown.nvim`
  - Markdown rendering in Neovim.
