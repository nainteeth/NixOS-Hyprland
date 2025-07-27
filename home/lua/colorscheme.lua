-- Colorscheme Configuration
-- This file is solely responsible for setting the Neovim colorscheme.
-- Ensure that the chosen colorscheme plugin is listed in `programs.neovim.plugins`
-- in your `home.nix` file (e.g., `dracula-nvim` is installed in this setup).

-- Set the colorscheme to Dracula.
-- The `vim.cmd()` function is used to execute a Vimscript command from Lua.
vim.cmd("colorscheme dracula")

-- You can replace "dracula" with the name of any other colorscheme
-- that you have installed via Home Manager.
-- Example:
-- vim.cmd("colorscheme nord")
-- vim.cmd("colorscheme catppuccin")
