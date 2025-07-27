-- Nvim-cmp Configuration (Autocompletion)
-- This file sets up `nvim-cmp`, the completion plugin, which provides intelligent
-- code completion suggestions as you type.

-- Require necessary modules:
local cmp = require('cmp')        -- The nvim-cmp module itself.
local luasnip = require('luasnip') -- The snippet engine used by nvim-cmp for snippet expansion.
local lspkind = require('lspkind') -- Provides icons for completion items (requires nvim-web-devicons).

-- Main nvim-cmp setup:
cmp.setup({
  -- Snippet engine configuration:
  snippet = {
    -- Define how snippets are expanded. Here, it tells cmp to use `luasnip`'s
    -- LSP-compatible snippet expansion function.
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  -- Completion window appearance:
  window = {
    -- Style the completion pop-up menu with borders.
    completion = cmp.config.window.bordered(),
    -- Style the documentation pop-up window (appears when hovering over items) with borders.
    documentation = cmp.config.window.bordered(),
  },
  -- Keymap configuration for nvim-cmp in INSERT mode:
  mapping = cmp.mapping.preset.insert({
    -- Navigate documentation:
    ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- Scroll documentation window up by 4 lines.
    ['<C-f>'] = cmp.mapping.scroll_docs(4),  -- Scroll documentation window down by 4 lines.

    -- Completion actions:
    ['<C-Space>'] = cmp.mapping.complete(), -- Manually trigger completion.
    ['<C-e>'] = cmp.mapping.abort(),        -- Abort (close) the completion menu.
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm the selected completion item.
                                                     -- `select = true` means if an item is highlighted, it's inserted.
                                                     -- Set to `false` if you want to explicitly select before confirming.
    -- Navigate completion items:
    -- You can add mappings for `<C-n>` and `<C-p>` to navigate next/previous,
    -- or use `<Tab>` and `<S-Tab>` if you're not using them for other purposes.
    -- For example:
    -- ['<Tab>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   elseif luasnip.expand_or_jumpable() then
    --     luasnip.expand_or_jump()
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's' }),
    -- ['<S-Tab>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   elseif luasnip.jumpable(-1) then
    --     luasnip.jump(-1)
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's' }),
  }),
  -- Completion sources:
  -- Define the order and types of sources nvim-cmp should use for suggestions.
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },    -- Suggestions from the attached LSP server (most intelligent).
    { name = 'luasnip' },     -- Suggestions from the `luasnip` snippet engine.
    { name = 'buffer' },      -- Suggestions from words already present in the current buffer.
    { name = 'path' },        -- Suggestions for file paths.
  }),
  -- Optional: Add styling/icons to completion items using `lspkind`.
  formatting = {
    format = lspkind.cmp_format({
      -- Options for lspkind:
      mode = 'symbol_text', -- Show only symbol (icon) and text (name).
      maxwidth = 50,        -- Maximum width of the item text.
      ellipsis_char = '...', -- Character to use for truncating.
      show_labelDetails = true, -- Show details from `labelDetails` (e.g., parameter names).
      -- You can customize individual symbols here if needed.
    })
  }
})

-- Command Line (Cmdline) completion for '/' (search) and '?' (reverse search):
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(), -- Use default command line mappings.
  sources = {
    { name = 'buffer' } -- Suggest words from the current buffer for search.
  }
})

-- Command Line (Cmdline) completion for ':' (ex commands):
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(), -- Use default command line mappings.
  sources = cmp.config.sources({
    { name = 'path' } -- Suggest file paths after certain commands (e.g., `:e `).
  }, {
    { name = 'cmdline' } -- Suggest built-in Neovim commands and arguments.
  })
})
