-- Global Neovim Options Configuration
-- These settings apply globally to your Neovim instance and affect its general behavior.
-- They are equivalent to `set` commands in Vimscript but are managed within Lua.

-- Clipboard Integration:
-- `unnamedplus`: Makes Neovim's default register ('"') sync with the system clipboard.
-- This allows you to copy (yank) text in Neovim and paste it into other applications,
-- and vice-versa. `unnamed` would sync with the selection clipboard (often primary selection on Linux).
vim.opt.clipboard = "unnamedplus"

-- True Color Support:
-- `true`: Enables 24-bit true color support in your terminal. This allows for
-- richer and more accurate color schemes. Your terminal emulator must also support true colors.
vim.opt.termguicolors = true

-- Cursor Line Highlighting:
-- `true`: Highlights the current line where your cursor is positioned.
-- Improves visibility and focus.
vim.opt.cursorline = true

-- Conceal Level:
-- `0`: Controls how concealed (hidden) text is displayed.
-- `0` means characters defined as 'concealed' (e.g., Markdown italics, certain LaTeX syntax)
-- will be shown as-is. Higher values would hide or replace them.
vim.opt.conceallevel = 0

-- Scroll Offset:
-- `8`: Sets the minimum number of screen lines to keep above and below the cursor
-- when scrolling. This ensures that your cursor never goes to the very top or bottom
-- of the screen, providing context.
vim.opt.scrolloff = 8

-- Fold Method:
-- `indent`: Sets the method used for code folding (collapsing blocks of code).
-- `indent` folds lines with the same indent level. Other common methods include 'syntax'
-- (based on language syntax) or 'marker' (based on special markers in the code).
vim.opt.foldmethod = "indent"

-- Fold Level Start:
-- `99`: Sets the default fold level when opening a buffer. A high number like 99
-- effectively means all folds are open by default, so you see your full code.
-- You can manually fold/unfold with `za`, `zc`, `zo`, `zr`, `zm` etc.
vim.opt.foldlevelstart = 99

-- Incremental Command Preview:
-- `split`: When performing a substitute command (`:s/old/new/`), `inccommand` shows
-- the changes live in a preview window (`split`). This helps to visualize the effect
-- of your substitution before applying it.
vim.opt.inccommand = "split"

-- Persistent Undo:
-- `true`: Enables persistent undo history. This means undo history is saved to a file
-- when you close Neovim and reloaded when you reopen the file, allowing you to undo
-- changes even after restarting Neovim.
vim.opt.undofile = true

-- Disable Swap Files:
-- `false`: Prevents Neovim from creating swap files (`.swp`). Swap files are traditionally
-- used for recovery in case of crashes or multiple instances editing the same file.
-- With `undofile` enabled, swap files are less critical for recovery for many users,
-- and disabling them can prevent clutter.
vim.opt.swapfile = false

-- Auto Read:
-- `true`: Automatically reloads the file if it has been changed externally (e.g., by Git,
-- another editor, or a background process). Neovim will prompt you if there are unsaved
-- changes to avoid overwriting them.
vim.opt.autoread = true

-- Ignore Case in Search:
-- `true`: Makes searches (`/`, `?`) case-insensitive by default.
vim.opt.ignorecase = true

-- Smart Case in Search:
-- `true`: Works in conjunction with `ignorecase`. If your search pattern contains
-- uppercase characters, the search becomes case-sensitive. If all characters are lowercase,
-- it remains case-insensitive. This is a very convenient setting.
vim.opt.smartcase = true

-- Highlight Search Results:
-- `true`: Highlights all occurrences of your current search pattern.
vim.opt.hlsearch = true
