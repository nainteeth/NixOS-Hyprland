-- Nvim-Treesitter Configuration
-- This file sets up `nvim-treesitter`, a modern and robust parsing library for Neovim.
-- It provides highly accurate and fast syntax highlighting, code folding, and
-- other language-aware features by parsing code into a syntax tree.

-- Require the nvim-treesitter config module.
require('nvim-treesitter.configs').setup {
  -- Ensure Installed Parsers:
  -- A list of language parser names that `nvim-treesitter` should ensure are installed.
  -- "all" is a special value that attempts to install all available parsers, but it's
  -- often better to list specific languages you use to avoid unnecessary downloads.
  -- If you add a new language server, consider adding its parser here too.
  ensure_installed = {
    "c",
    "cpp",
    "lua",
    "vim",
    "vimdoc",
    "query",       -- For Treesitter query language itself
    "javascript",
    "typescript",
    "html",
    "css",
    "json",
    "python",
    -- Add more languages as you need them:
    -- "rust",
    -- "go",
    -- "java",
    -- "toml",
    -- "yaml",
    -- "markdown",
    -- "bash",
  },

  -- Synchronous Installation:
  -- `false`: Installs parsers asynchronously (in the background). This is generally
  -- preferred as it doesn't block Neovim startup.
  -- `true`: Installs parsers synchronously. Can be useful for debugging setup issues,
  -- but will block Neovim.
  sync_install = false,

  -- Auto-Install Missing Parsers:
  -- `true`: Automatically prompts to install a missing parser when you open a buffer
  -- of a language for which a parser isn't installed.
  auto_install = true,

  -- Highlight Module:
  -- Configuration for syntax highlighting provided by Treesitter.
  highlight = {
    enable = true, -- Enable Treesitter syntax highlighting.
    -- Disabling Vim's default syntax:
    -- Setting `disable = {}` will typically run `:h syntax` and disable Vim's
    -- built-in regex-based syntax highlighting, allowing Treesitter to take over
    -- completely. This is usually desired for better performance and accuracy.
    disable = {}, -- You can add filetypes here (e.g., {"tex", "markdown"})
                  -- to explicitly disable Treesitter highlighting for them.
  },

  -- Indent Module:
  -- Configuration for Treesitter-based indentation.
  indent = { enable = true }, -- Enable Treesitter to provide smart indentation.

  -- Incremental Selection (optional, uncomment to enable):
  -- Allows you to incrementally select code blocks based on the syntax tree.
  -- Recommended for visual selection.
  -- incremental_selection = {
  --   enable = true,
  --   keymaps = {
  --     init_selection = "<CR>",
  --     node_incremental = "<CR>",
  --     scope_incremental = "<BS>",
  --     node_decrement = "<BS>",
  --   },
  -- },

  -- Text Objects (optional, uncomment to enable):
  -- Defines Treesitter-based text objects (e.g., `af` for "a function", `ib` for "inner block").
  -- Requires `vim-textobj-user` or similar functionality.
  -- textobjects = {
  --   select = {
  --     enable = true,
  --     lookasides = {
  --       ["af"] = { query = "(function_definition) @function.outer", selection = "outer" },
  --       ["if"] = { query = "(function_definition) @function.inner", selection = "inner" },
  --       -- Add more text objects as needed.
  --     },
  --   },
  -- },

  -- Context (optional, uncomment to enable):
  -- Shows the current function/class context in the statusline or a floating window.
  -- context_commentstring = {
  --   enable = true,
  --   enable_autocmd = false,
  -- },
}
