-- Keymaps Configuration
-- This file defines custom keyboard shortcuts (keymaps) for Neovim actions and
-- for various plugin functionalities.

-- Local aliases for convenience:
local map = vim.api.nvim_set_keymap -- Function to set keymaps
local opt = { noremap = true, silent = true } -- Common options for keymaps:
                                             -- `noremap`: Prevents recursive mapping (map a to b, b to c, a -> c)
                                             -- `silent`: Suppresses status line messages for the mapping

-- Set the Leader Key:
-- The leader key is a special prefix key used for custom keybindings.
-- It's common practice to set it to `<space>` (spacebar) for easy access.
vim.g.mapleader = " "

-- --------------------------------------------------------------------------
-- General Neovim Keymaps
-- --------------------------------------------------------------------------

-- Example: Quick save (can use `:w` directly, but a map can be handy)
-- map("n", "<leader>w", ":w<CR>", opt)

-- Example: Close current buffer without quitting Neovim
-- map("n", "<leader>q", ":bd<CR>", opt)

-- --------------------------------------------------------------------------
-- Plugin-Specific Keymaps
-- --------------------------------------------------------------------------

-- NvimTree (File Explorer) Toggle:
-- `<leader>n`: Maps pressing space then 'n' to toggle the NvimTree file explorer.
map("n", "<leader>n", ":NvimTreeToggle<CR>", opt)

-- Telescope (Fuzzy Finder) Keymaps:
-- These maps use the `<cmd>` prefix to execute a Neovim command (`<cmd>Telescope ...`).
-- This is the recommended way to call commands in keymaps for performance.
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opt) -- Find files in current directory (fuzzy search).
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opt)  -- Live grep (search for text content) in files.
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opt)    -- List and switch between open buffers.
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opt)  -- Search Neovim's help documentation.

-- LSP (Language Server Protocol) Keymaps:
-- These keymaps are essential for interacting with language servers, providing
-- IDE-like features. They typically call `vim.lsp.buf.<function>()` which are
-- built-in Neovim functions for LSP client interaction on the current buffer.
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)     -- Go to definition of the symbol under cursor.
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)   -- Go to declaration (similar to definition, but distinct in some languages).
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)    -- Find all references to the symbol under cursor.
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt) -- Go to implementation (e.g., for interface methods).
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)           -- Show hover documentation for the symbol under cursor.
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt) -- Rename symbol globally within its scope.
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt) -- Show code actions (e.g., refactorings, quick fixes).
map("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", opt)   -- Format the current buffer (requires a formatter linked to LSP).

-- Optional: Keymaps for navigating LSP diagnostics (errors/warnings)
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt) -- Go to previous diagnostic.
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt) -- Go to next diagnostic.
map("n", "<leader>vd", "<cmd>lua vim.diagnostic.open_float()<CR>", opt) -- Open float window with diagnostic details.
map("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opt) -- Populate quickfix list with diagnostics.

-- --------------------------------------------------------------------------
-- Visual Mode (selection-based) Keymaps
-- --------------------------------------------------------------------------

-- Example: Format visual selection (requires LSP format support)
-- map("x", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true, range = { vim.fn.getpos(\"'<\"), vim.fn.getpos(\"'>\") } })<CR>", opt)
