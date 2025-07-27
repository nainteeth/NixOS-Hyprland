-- Gitsigns Configuration (Git Integration)
-- This file configures `gitsigns.nvim`, a plugin that provides visual cues for
-- Git changes (additions, deletions, modifications) in the Neovim gutter (sign column).

-- Require the gitsigns module.
require('gitsigns').setup({
  -- Custom signs (markers) to display in the gutter for different Git statuses.
  signs = {
    add          = { text = '+' },    -- New line added.
    change       = { text = '~' },    -- Line modified.
    delete       = { text = '_' },    -- Line deleted (shown on the line above).
    topdelete    = { text = '‾' },    -- Line deleted at the top of a hunk.
    changedelete = { text = '~' },    -- Line changed and deleted.
  },
  -- Visibility of the sign column.
  -- `true` ensures the sign column is always visible for gitsigns.
  -- This often works in conjunction with `set signcolumn=yes` in `extraConfig`.
  signcolumn = true,

  -- Highlight the number column if there's a Git sign on the line.
  numhl = false,      -- Set to `true` to enable.
  -- Highlight the entire line if there's a Git sign on the line.
  linehl = false,     -- Set to `true` to enable.

  -- Word Diff:
  -- `false`: Disables word-level diff highlighting.
  -- `true`: Enables highlighting of changed words within a line (similar to `git diff --word-diff`).
  word_diff = false,

  -- Git Directory Watcher:
  -- Settings for how frequently Gitsigns checks for changes in the Git repository.
  watch_gitdir = {
    interval = 1000,        -- Check every 1000 milliseconds (1 second).
    follow_files = true     -- Follow file renames/moves within the Git repo.
  },
  -- Whether to attach Gitsigns to untracked files.
  attach_to_untracked = true,

  -- Current Line Blame:
  -- `false`: Disables showing Git blame information for the current line by default.
  -- `true`: Enables it. You can toggle this with the `:Gitsigns Blame` command.
  current_line_blame = false,
  current_line_blame_opts = {
    virt_text = true,      -- Show blame information as virtual text.
    virt_text_pos = 'eol', -- Position virtual text at the end of the line ('eol' | 'overlay' | 'right_align').
    delay = 1000,          -- Delay in milliseconds before showing blame text on `CursorHold`.
    ignore_whitespace = false, -- Whether to ignore whitespace changes when blaming.
  },

  -- Status Line Integration (optional, for use with statusline plugins like `lualine.nvim`):
  -- status_formatter = nil, -- You can provide a custom function here for status line display.

  -- Diagnostics Integration (optional):
  -- Enables showing LSP diagnostics in the Gitsigns hunk preview.
  -- diagnostics_integration = false,

  -- Keybindings (optional, can be set in `lua/keymaps.lua` or here):
  -- This section shows common mappings for Gitsigns. You can uncomment them
  -- or move them to `lua/keymaps.lua` for centralized keymap management.
  -- mappings = {
  --   -- stylua: ignore start
  --   ['n <leader>hs'] = ':Gitsigns StageHunk<CR>',
  --   ['v <leader>hs'] = ':Gitsigns StageHunk<CR>',
  --   ['n <leader>hr'] = ':Gitsigns ResetHunk<CR>',
  --   ['v <leader>hr'] = ':Gitsigns ResetHunk<CR>',
  --   ['n <leader>hS'] = '<cmd>Gitsigns StageBuffer<CR>',
  --   ['n <leader>hR'] = '<cmd>Gitsigns ResetBuffer<CR>',
  --   ['n <leader>hu'] = '<cmd>Gitsigns UndoStageHunk<CR>',
  --   ['n <leader>hp'] = '<cmd>Gitsigns PreviewHunk<CR>',
  --   ['n <leader>hb'] = '<cmd>Gitsigns BlameLine<CR>',
  --   ['n <leader>hd'] = '<cmd>Gitsigns DiffThis<CR>',
  --   ['n <leader>hD'] = '<cmd>Gitsigns DiffThisCached<CR>',
  --   ['n ]g'] = '<cmd>Gitsigns NextHunk<CR>',
  --   ['n [g'] = '<cmd>Gitsigns PrevHunk<CR>',
  --   -- stylua: ignore end
  -- },
})
