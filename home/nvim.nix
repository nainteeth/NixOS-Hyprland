{ config, pkgs, lib, configDir, ... }:

let
  # This is a helper function to read Lua configuration files.
  # It takes a file name (e.g., "options.lua") and constructs the full path
  # relative to this home.nix file (assuming a 'lua' subdirectory exists).
  # This keeps your main Nix file clean and allows for better organization
  # of your Neovim Lua configuration into separate, logical files.
  readLua = file: builtins.readFile (configDir + "/lua/${file}");
in
{
  # Enable the Neovim program module in Home Manager.
  # This tells Home Manager to manage Neovim's installation and configuration.
  programs.neovim = {
    enable = true;
    # Set Neovim as the default editor for commands like 'git commit'.
    defaultEditor = true;
    # Create an alias 'vi' that points to 'nvim'.
    viAlias = true;
    # Create an alias 'vim' that points to 'nvim'.
    vimAlias = true;

    # Basic Neovim settings in Vimscript.
    # While most modern Neovim configurations are in Lua, some simple
    # global settings can still be defined here in Vimscript.
    # For more complex or plugin-specific settings, Lua (via extraLuaConfig) is preferred.
    extraConfig = ''
      set number            " Show absolute line numbers.
      set relativenumber    " Show relative line numbers for movement commands.
      set expandtab         " Use spaces instead of tabs.
      set tabstop=2         " A tab character (if used) will display as 2 spaces.
      set shiftwidth=2      " Autoindent will use 2 spaces.
      set autoindent        " Copy indent from the previous line when creating new lines.
      set hidden            " Allow switching buffers without saving unsaved changes.
                            " Changes will be kept in memory until explicitly saved or discarded.
      set noerrorbells      " Disable the annoying bell sound on errors.
      set nowrap            " Don't wrap lines; lines will extend horizontally.
      set mouse=a           " Enable mouse support in all modes (normal, visual, insert, command-line).
      set cmdheight=1       " Set the command line height to 1 line.
      set updatetime=300    " Time in milliseconds to wait before writing swap file and triggering
                            " 'CursorHold' autocommand (relevant for LSP diagnostics popups).
      set signcolumn=yes    " Always show the sign column. This prevents text from jumping
                            " when LSP diagnostics (errors/warnings) or Git signs appear/disappear.
      set termguicolors     " Enable true color support for terminal UIs (requires a terminal
                            " emulator that supports 24-bit true colors, e.g., Alacritty, Kitty).
    '';

    # Declare Neovim plugins that Home Manager should install.
    # `with pkgs.vimPlugins;` allows you to refer to plugins directly by their
    # Nixpkgs name (e.g., `nvim-lspconfig` instead of `pkgs.vimPlugins.nvim-lspconfig`).
    plugins = with pkgs.vimPlugins; [
      # --------------------------------------------------------------------------
      # LSP (Language Server Protocol) and Autocompletion
      # These are the core components for IDE-like features.
      # --------------------------------------------------------------------------
      nvim-lspconfig      # The main client for Neovim's built-in LSP.
                          # It provides configurations for various language servers.
      nvim-cmp            # A powerful and highly customizable completion engine.
      cmp-nvim-lsp        # Completion source for nvim-cmp from LSP servers.
      cmp-buffer          # Completion source for nvim-cmp from current buffer words.
      cmp-path            # Completion source for nvim-cmp for file paths.
      cmp-cmdline         # Completion source for nvim-cmp for command-line mode.
      cmp-vsnip           # Completion source for nvim-cmp that integrates with `vim-vsnip`.
      luasnip             # A modern snippet engine written in Lua. Used by nvim-cmp.
      vim-vsnip           # Default snippets for the `luasnip` engine.

      # --------------------------------------------------------------------------
      # Utility and Navigation
      # --------------------------------------------------------------------------
      telescope-nvim      # A highly extensible fuzzy finder. Essential for quick
                          # file opening, grepping, buffer switching, etc.
      plenary-nvim        # A collection of Lua functions used by many plugins,
                          # including Telescope. It's a common dependency.

      # --------------------------------------------------------------------------
      # File Explorer
      # --------------------------------------------------------------------------
      nvim-tree-lua       # A popular Neovim file explorer written in Lua.
                          # Displays a file tree in a sidebar.
      # You could choose `neo-tree-nvim` instead if preferred, but only one
      # file explorer should be enabled at a time.

      # --------------------------------------------------------------------------
      # Syntax Highlighting and Parsing
      # --------------------------------------------------------------------------
      nvim-treesitter.withAllGrammars # Modern, accurate, and fast syntax highlighting
                                    # and code parsing. `.withAllGrammars` includes
                                    # a large set of common language grammars by default.
                                    # This is a Nixpkgs-specific attribute to get all grammars easily.

      # --------------------------------------------------------------------------
      # Git Integration
      # --------------------------------------------------------------------------
      gitsigns-nvim       # Displays Git change indicators (additions, deletions, modifications)
                          # in the sign column next to line numbers.

      # --------------------------------------------------------------------------
      # Icons and Aesthetics
      # --------------------------------------------------------------------------
      nvim-web-devicons   # Provides file-type icons for plugins like nvim-tree
                          # and Telescope. Makes the UI more visually appealing.

      # --------------------------------------------------------------------------
      # Colorscheme
      # --------------------------------------------------------------------------
      dracula-nvim        # A popular, dark colorscheme. You can replace this with
                          # any other colorscheme available in `pkgs.vimPlugins`.
    ];

    # Embed Lua configuration directly.
    # This is where you configure your installed plugins using Lua.
    # We use the `readLua` helper function to pull content from separate files
    # within the 'lua/' subdirectory. This greatly improves organization.
    extraLuaConfig = ''
      -- Load Neovim global options and basic settings
      ${readLua "options.lua"}
      -- Load keybindings
      ${readLua "keymaps.lua"}
      -- Load Language Server Protocol (LSP) configuration
      ${readLua "lsp.lua"}
      -- Load Autocompletion (nvim-cmp) configuration
      ${readLua "cmp.lua"}
      -- Load Fuzzy Finder (Telescope) configuration
      ${readLua "telescope.lua"}
      -- Load File Explorer (nvim-tree) configuration
      ${readLua "nvimtree.lua"}
      -- Load Treesitter configuration for syntax highlighting and parsing
      ${readLua "treesitter.lua"}
      -- Load GitSigns configuration for Git integration
      ${readLua "gitsigns.lua"}
      -- Load Colorscheme configuration
      ${readLua "colorscheme.lua"}
    '';

    # Install additional packages from Nixpkgs that are not Neovim plugins
    # but are essential for IDE functionality, such as Language Servers,
    # formatters, and linters. These are external executables that Neovim's
    # LSP client (`nvim-lspconfig`) will interact with.
    extraPackages = with pkgs; [
      nil_ls                          # Nix Language Server for Nix files.
      lua-language-server             # Language server for Lua.
      nodePackages.typescript-language-server # LSP for TypeScript/JavaScript.
      nodePackages.prettier           # A popular code formatter for web languages.
      # Add more language servers, formatters, or linters as needed for your specific development languages:
      # rust-analyzer                   # Rust language server.
      # go                              # Go language tools, including gopls (Go language server).
      # python3Packages.python-lsp-server # Python language server (pylsp).
      # clang-tools                     # For C/C++/Objective-C language server (clangd).
      # black                           # Python code formatter.
      # ruff                            # Python linter and formatter.
      # stylua                          # Lua code formatter.
    ];
  };

  # Set the home-manager generation directory to a more standard location.
  # This makes sure Home Manager puts its generated files in a predictable place.
  # home.sessionVariables = {
  #   NIX_HOME_MANAGER_GENERATION_DIR = "${config.xdg.dataHome}/home-manager/generations";
  # };
}
