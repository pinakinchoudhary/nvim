# Neovim Inventory

Current active setup after pruning overlapping tools.

## Core

- `init.lua` sets space leader, enables Nerd Font icons, and loads `utils.lazy`, `core.options`, `core.keymaps`, `core.autocmds`, and `plugins`.
- Options enable line numbers, relative numbers, mouse, OSC52 clipboard, `termguicolors`, rounded borders, persistent undo, smart search, stable split behavior, whitespace display, cursorline, scroll margins, hidden buffers, and confirmation prompts.
- Core keymaps cover diagnostics, quickfix/location-list movement, terminal escape, insert `jk` escape, split navigation, word replacement, and Neogit.

## Plugin Imports

- `plugins.lsp`
- `plugins.treesitter`
- `plugins.ui`
- `plugins.debug`
- `plugins.misc`
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
- `plugins.navigation`
- `plugins.tasks`
- `plugins.quickfix`

## Deliberately Removed

- Telescope: replaced by Snacks picker.
- Neo-tree: replaced by Oil for directory buffers and file operations.
- FTerm: replaced by Snacks terminal.
- Tabout: removed to avoid overlap with Blink/LuaSnip/autopairs.
- Indent-blankline: replaced by Snacks indent.
- Standalone nvim-notify: replaced by Snacks notifier.
- Render-markdown: removed because it triggers a Neovim 0.12.2 Treesitter markdown parser error loop.
- **Markdown Treesitter Support**: Completely disabled across all plugins (nvim-treesitter, snacks.nvim) to prevent Neovim 0.12 crashes.

## Search, UI, And QoL

- `folke/snacks.nvim`
  - Central UX layer.
  - Enabled: bigfile, input, notifier, quickfile, statuscolumn, words, picker, scroll, indent, terminal, zen, scope.
  - **Hard-disabled Treesitter for Markdown**:
    - `scope` and `indent` filter out markdown buffers.
    - `picker` previewer force-stops Treesitter and falls back to regex syntax for markdown files.
  - Keymaps:
    - `<leader>p` smart picker.
    - `<leader>,` buffers.
    - `<leader>:` command history.
    - `<leader>n` notification history.
    - `<leader>z` zen mode.
    - `<leader>tt` floating terminal.
  - Toggle maps:
    - `<leader>tw` wrap.
    - `<leader>ts` spell.
    - `<leader>td` diagnostics.
    - `<leader>th` inlay hints.
    - `<leader>ti` indent.
    - `<leader>tz` dim.
    - `<leader>tn` line numbers.
    - `<leader>tr` relative numbers.
- `catppuccin/nvim`
  - Main colorscheme, transparent core/Oil highlights.
- `folke/todo-comments.nvim`
  - Todo highlighting without signs.
- `folke/flash.nvim`
  - In-buffer jump/search.
- `j-hui/fidget.nvim`
  - LSP progress UI.

## Files And Navigation

- `stevearc/oil.nvim`
  - Owns directory buffers, including `nvim .`.
  - `-` opens parent directory.
  - `<leader>o` opens Oil in a float.
  - Shows hidden files and icon column.
- `cbochs/grapple.nvim`
  - Project-scoped file tags.
  - `<leader>m` toggles the current file tag.
  - `<leader>M` opens the tag list window.
  - `<leader>1` through `<leader>4` jump to tags.
  - `<leader>[` / `<leader>]` cycle tags.
- `hedyhli/outline.nvim`
  - `<leader>so` toggles LSP/markdown symbol outline.
- `XXiaoA/atone.nvim`
  - `<leader>u` toggles undo tree.

## LSP, Completion, Formatting

- `folke/lazydev.nvim`
  - Lua development support for Neovim config/plugin code.
- `neovim/nvim-lspconfig`
  - Mason-backed LSP setup with Blink capabilities.
  - LSP symbol/reference pickers now use Snacks picker APIs.
  - Configures `lua_ls`.
- `saghen/blink.cmp`
  - Completion engine with LuaSnip snippets and lazydev source.
- `L3MON4D3/LuaSnip`
  - Snippet engine.
- `stevearc/conform.nvim`
  - `<leader>f` formats; Lua uses `stylua`.
- `mfussenegger/nvim-lint`
  - Markdown linting with `markdownlint`.

## Editing

- `nvim-treesitter/nvim-treesitter`
  - **Branch: master** (reverted from main due to update failures).
  - Highlighting and indentation (Markdown disabled).
- `windwp/nvim-autopairs`
  - Pair insertion.
- `fedepujol/move.nvim`
  - `<A-j>` / `<A-k>` move lines and visual blocks.
- `echasnovski/mini.nvim`
  - `mini.ai`, `mini.surround`, and `mini.statusline`.
- `NMAC427/guess-indent.nvim`
  - Indentation detection.

## Git

- `lewis6991/gitsigns.nvim`
  - Signs, hunk navigation, hunk staging/reset/preview/blame/diff keymaps.
- `NeogitOrg/neogit`
  - `<leader>gg` and `:Neogit`.
  - Uses `diffview.nvim` as the optional diff integration.

## Tasks, Tests, Debugging

- `mfussenegger/nvim-dap`
- `rcarriga/nvim-dap-ui`
- `jay-babu/mason-nvim-dap.nvim`
- `leoluz/nvim-dap-go`
- `stevearc/overseer.nvim`
  - `<leader>or`, `<leader>ot`, `<leader>oa`.
- `nvim-neotest/neotest` with `neotest-go`
  - `<leader>nr`, `<leader>nf`, `<leader>na`, `<leader>nd`, `<leader>ns`, `<leader>no`, `<leader>nO`, `<leader>nv`.

## Quickfix

- `stevearc/quicker.nvim`
  - `<leader>qq` toggles quickfix.
  - `<leader>ql` toggles location list.
  - `>` expands context.
  - `<` collapses context.

## Verification

- Ran `nvim --headless '+Lazy! sync' '+qa'`.
- Ran `nvim --headless '+qa'`.
- Ran `nvim --headless . '+qa'`.
- Ran `nvim --headless NEOVIM_INVENTORY.md '+qa'`.
- Ran explicit lazy-load/integration check for Snacks, Oil, Grapple, Neotest, Overseer, Quicker, Outline, and Atone.
- Ran Stylua on edited Lua files.
