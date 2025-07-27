-- Telescope Configuration (Fuzzy Finder)
-- This file configures `telescope.nvim`, a highly extensible fuzzy finder
-- that allows for quick navigation, searching, and filtering of various items
-- (files, buffers, git changes, help tags, etc.).

-- Require the telescope module.
local telescope = require('telescope')

-- Setup Telescope with default configurations.
-- These defaults apply to all Telescope pickers unless overridden by a specific picker.
telescope.setup({
  defaults = {
    -- Arguments for `vimgrep` (used for `live_grep`).
    -- Here, we configure `rg` (ripgrep) as the backend for `live_grep`.
    vimgrep_arguments = {
      'rg',             -- The ripgrep executable.
      '--color=never',  -- Disable color output from ripgrep.
      '--no-heading',   -- Don't print file names above matches (Telescope handles this).
      '--with-filename',-- Include filename in output (Telescope parses this).
      '--line-number',  -- Include line number.
      '--column',       -- Include column number.
      '--smart-case',   -- Smart case search (like Neovim's `smartcase` option).
    },
    prompt_prefix = "   ", -- Prefix displayed in the prompt (e.g., a search icon).
    selection_caret = " ",  -- Character for the selected item (e.g., an arrow).
    entry_prefix = "  ",    -- Prefix for each entry in the results list.
    initial_mode = "insert",-- Default mode when opening a Telescope picker ('insert' or 'normal').
    selection_strategy = "closest", -- Strategy for selecting items with <CR> in normal mode.
                                  -- 'closest' selects the nearest item to the cursor.
    layout_strategy = "horizontal", -- Default layout for pickers ('horizontal', 'vertical', 'flex', 'center').
    layout_config = {
      horizontal = {
        prompt_position = "top",    -- Position of the prompt in horizontal layout.
        preview_width = 0.55,       -- Width of the preview window (relative to total width).
        results_width = 0.8,        -- Width of the results list.
      },
      vertical = {
        mirror = false,             -- Whether to mirror the layout in vertical mode.
      },
      -- You can add `flex` or `center` configurations here as well if you use those strategies.
    },
    file_sorter = require('telescope.sorters').get_fuzzy_file,    -- Sorting function for file results.
    file_ignore_patterns = {"node_modules", ".git"}, -- Patterns for files/directories to ignore during search.
    generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter, -- Generic sorting function for other pickers.
    winblend = 0,               -- Transparency of the Telescope windows (0-100, 0 is opaque).
    -- path_display = {"truncate"}, -- How file paths are displayed (e.g., `truncate` will shorten long paths).
    set_env = { NODE_COMMAND = 'node' }, -- Environment variables to set for Telescope processes (e.g., for `ripgrep`).
    -- History configuration (optional, uncomment to enable):
    -- history = {
    --   path = vim.fn.stdpath "data" .. "/telescope_history.nvim", -- Path to store search history.
    --   limit = 100, -- Maximum number of history entries.
    -- },
  },
  -- You can define specific configurations for individual pickers here.
  -- For example, to customize `find_files`:
  -- pickers = {
  --   find_files = {
  --     theme = "dropdown", -- Use a 'dropdown' theme for file finding.
  --     hidden = true,      -- Show hidden files by default for this picker.
  --   }
  -- }
})

-- Optional: Load extensions if you have any.
-- For example, if you installed `telescope-fzf-native.nvim` for C-based speed:
-- require('telescope').load_extension('fzf')
