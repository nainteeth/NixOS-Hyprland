-- NvimTree Configuration (File Explorer)
-- This file configures `nvim-tree.lua`, a file explorer plugin that displays
-- your project's file structure in a sidebar.

-- Require the nvim-tree module.
require("nvim-tree").setup({
  -- Sorting options for files and directories in the tree.
  sort_by = "case_sensitive", -- Sort items case-sensitively. Other options include "name", "accessed_on", etc.

  -- View options for the NvimTree window.
  view = {
    width = 30, -- Set the width of the NvimTree sidebar to 30 columns.
    -- auto_resize = true, -- Automatically resize the tree based on content.
    -- adaptive_size = false, -- Whether the tree adjusts its width dynamically.
    -- side = "left",      -- Position the tree on the "left" or "right" side of the window.
    -- float = {           -- Floating window settings (uncomment to enable floating tree).
    --   enable = false,
    --   quit_on_focus_lose = true,
    --   open_win_config = {
    --     relative = "editor",
    --     border = "rounded",
    --     width = 60,
    --     height = 40,
    --     row = 1,
    --     col = 1,
    --   },
    -- },
  },
  -- Renderer options for how items are displayed.
  renderer = {
    group_empty = true, -- Group empty directories together.
    -- markers = {         -- Customize markers (e.g., for directories, files, Git status).
    --   folder = {
    --     default = "",
    --     open = "",
    --     empty = "",
    --     empty_open = "",
    --   },
    -- },
    -- icons = {           -- Icon display settings (requires nvim-web-devicons).
    --   glyphs = {
    --     folder = {
    --       arrow_open = "",
    --       arrow_closed = "to",
    --       default = "",
    --       open = "",
    --       empty = "",
    --       empty_open = "",
    --     },
    --     git = {
    --       unstaged = "✗",
    --       staged = "✓",
    --       untracked = "★",
    --       ignored = "◌",
    --       deleted = " trash",
    --     },
    --   },
    -- },
  },
  -- Filter options to control which files/directories are displayed.
  filters = {
    dotfiles = false, -- Set to `false` to show dotfiles (e.g., `.bashrc`, `.git`).
                      -- Set to `true` to hide them by default.
    -- custom = { ".git", "node_modules", ".DS_Store" }, -- Add custom patterns to hide.
    -- exclude = {},     -- Patterns for files/directories to explicitly exclude.
  },
  -- Actions configuration for file operations.
  actions = {
    open_file = {
      quit_on_open = true, -- Close the NvimTree window when a file is opened.
      -- resize_window = true, -- Resize the main Neovim window after closing NvimTree.
    }
  },
  -- Git integration settings.
  git = {
    enable = true,      -- Enable Git integration (shows status of files).
    ignore = false,     -- Don't ignore Git ignored files in the tree.
    -- show_on_dirs = true, -- Show Git status for directories.
  },
  -- Diagnostics integration (shows LSP errors/warnings in the tree).
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  -- Keyboard shortcuts within NvimTree.
  -- You can customize these, but the defaults are usually good.
  -- For example:
  -- mappings = {
  --   custom_only = false, -- True to disable all default mappings.
  --   list = {
  --     { key = "l", cb = require("nvim-tree.actions.quit").execute }, -- Example: `l` to quit tree.
  --     { key = "<CR>", cb = require("nvim-tree.actions.edit").execute }, -- Example: `CR` to open file.
  --   },
  -- },
})

-- If you prefer `neo-tree.nvim` (uncomment the following and comment out nvim-tree.lua setup):
-- require("neo-tree").setup({
--   window = {
--     width = 30,
--   },
--   filesystem = {
--     filtered_items = {
--       hide_dotfiles = false,
--     }
--   },
--   -- You would configure other aspects of neo-tree here similarly.
-- })
