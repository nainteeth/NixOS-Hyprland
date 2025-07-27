-- LSP Configuration (Language Server Protocol)
-- This file configures Neovim's built-in Language Server Protocol (LSP) client.
-- LSP provides IDE-like features such as auto-completion, go-to-definition,
-- hover documentation, diagnostics (errors/warnings), and refactoring.

-- Require the nvim-lspconfig plugin. This plugin provides helper functions
-- and default configurations for various language servers.
local lspconfig = require('lspconfig')

-- Auto Command for LSP Attachment:
-- This `autocmd` (auto command) is crucial. It defines actions to be performed
-- automatically whenever an LSP server attaches to a buffer (i.e., when you open
-- a file for which an LSP server is configured and starts).
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}), -- Create a unique augroup to manage this autocmd.
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o> (default Neovim completion)
    -- This ensures that Neovim's omnifunc (often used by older completion plugins)
    -- is set to the LSP-provided completion. `nvim-cmp` will override this for
    -- most completion needs, but it's good practice.
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings:
    -- These keymaps are set ONLY for the buffer to which the LSP server is attached.
    -- This prevents conflicts with global keymaps and ensures LSP functions are
    -- only active when relevant.
    local bufopts = { noremap=true, silent=true, buffer=ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)      -- Go to declaration
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)       -- Go to definition
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)             -- Show hover documentation
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)   -- Go to implementation
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)       -- Find references
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)   -- Rename symbol
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts) -- Show code actions
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, bufopts)     -- Format code (uses attached formatter)

    -- Optional: Highlight references when cursor is on a symbol
    -- This creates a highlight group for references and then clears it when leaving.
    local orig_on_attach = lspconfig.util.on_attach
    lspconfig.util.on_attach = function(client, bufnr)
      orig_on_attach(client, bufnr)
      -- Highlight references of the word under cursor
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.document_highlight()
        end,
      })
      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.clear_references()
        end,
      })
    end
  end,
})

-- Common LSP Server Setups:
-- Here, you explicitly `setup` each language server you want to use.
-- `lspconfig` provides default configurations for many servers.
-- You can pass an optional table of settings to customize each server.

-- Lua Language Server (`lua_ls`):
-- Configures the Lua language server, useful for Neovim configuration itself.
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using.
        -- Neovim uses LuaJIT, so this is generally appropriate.
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global variable
        -- which is essential for working with Neovim's Lua API.
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim's runtime files (e.g., built-in Lua modules).
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing your machine info.
      telemetry = {
        enable = false,
      },
    },
  },
}

-- TypeScript/JavaScript Language Server (`tsserver`):
lspconfig.tsserver.setup {}

-- HTML Language Server (`html`):
lspconfig.html.setup {}

-- CSS Language Server (`cssls`):
lspconfig.cssls.setup {}

-- JSON Language Server (`jsonls`):
lspconfig.jsonls.setup {}

-- Nix Language Server (`nil_ls`):
-- Requires `nil` to be installed via `extraPackages` in `home.nix`.
lspconfig.nil_ls.setup {}

-- Add other language servers as needed by uncommenting and configuring them.
-- Remember to also add them to `programs.neovim.extraPackages` in your `home.nix`.
-- lspconfig.rust_analyzer.setup {} -- For Rust development.
-- lspconfig.gopls.setup {}         -- For Go development.
-- lspconfig.pylsp.setup {}         -- For Python development (requires `python-lsp-server`).
-- lspconfig.clangd.setup {}        -- For C/C++/Objective-C development (requires `clang-tools`).
