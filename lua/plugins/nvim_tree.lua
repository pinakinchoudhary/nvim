-- nvim-tree: sidebar file explorer (from Salar's config)
-- Complements oil.nvim (oil = productivity, nvim-tree = sidebar browsing)
return {
  {
    'nvim-tree/nvim-tree.lua',
    -- Load eagerly so nvim-web-devicons is available for all other plugins too
    lazy = false,
    dependencies = {
      { 'nvim-tree/nvim-web-devicons', lazy = false },
    },
    keys = {
      { '<C-n>', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle nvim-tree sidebar' },
      {
        '<leader>e',
        function()
          local api = require 'nvim-tree.api'
          local view = require 'nvim-tree.view'
          if view.is_visible() then
            -- Already open: if cursor is IN the tree, close it; otherwise focus it
            if vim.api.nvim_get_current_win() == view.get_winnr() then
              api.tree.close()
            else
              api.tree.focus()
            end
          else
            api.tree.open()
          end
        end,
        desc = 'Smart toggle nvim-tree (open / focus / close)',
      },
    },
    config = function()
      require('nvim-web-devicons').setup { default = true }

      require('nvim-tree').setup {
        -- oil.nvim owns directory buffers; nvim-tree is purely a toggled sidebar
        hijack_netrw = false,
        sync_root_with_cwd = true,
        respect_buf_cwd = false,
        update_focused_file = {
          enable = true,
          update_root = false,
        },
        view = {
          side = 'left',
          width = 35,
          preserve_window_proportions = true,
        },
        actions = {
          open_file = {
            quit_on_open = false,
            resize_window = true,
          },
        },
        renderer = {
          highlight_opened_files = 'all',
          indent_markers = { enable = true },
          icons = {
            web_devicons = {
              file   = { enable = true, color = true },
              folder = { enable = false },        -- use glyphs below for folders
            },
            show = {
              file         = true,
              folder       = true,
              folder_arrow = true,
              git          = true,
            },
            -- Use explicit NerdFont codepoints so they always render correctly
            glyphs = {
              default  = '󰈚',   -- nf-md-file
              symlink  = '󰌷',   -- nf-md-link_variant
              bookmark = '󰆤',   -- nf-md-bookmark
              modified = '●',
              folder = {
                arrow_closed = '',   -- nf-fa-caret_right
                arrow_open   = '',   -- nf-fa-caret_down
                default      = '󰉋',  -- nf-md-folder
                open         = '󰝰',  -- nf-md-folder_open
                empty        = '󰉖',  -- nf-md-folder_outline
                empty_open   = '󰷏',  -- nf-md-folder_open_outline
                symlink      = '󰉒',  -- nf-md-folder_move
                symlink_open = '󰉓',  -- nf-md-folder_move (open)
              },
              git = {
                unstaged  = '✗',
                staged    = '✓',
                unmerged  = '',
                renamed   = '➜',
                untracked = '★',
                deleted   = '󰆴',
                ignored   = '◌',
              },
            },
          },
        },
        git     = { enable = true, ignore = false },
        filters = { dotfiles = false },
      }
    end,
  },
}
