{ config, pkgs, lib, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;

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
      set mouse=a           " Enable mouse support in all modes (normal, visual, insert, command-line).
      set cmdheight=1       " Set the command line height to 1 line.
      set updatetime=300    " Time in milliseconds to wait before writing swap file and triggering
                            " 'CursorHold' autocommand (relevant for LSP diagnostics popups).
      set signcolumn=yes    " Always show the sign column. This prevents text from jumping
                            " when LSP diagnostics (errors/warnings) or Git signs appear/disappear.
      set termguicolors     " Enable true color support for terminal UIs (requires a terminal
                            " emulator that supports 24-bit true colors, e.g., Alacritty, Kitty).
    '';

    plugins = with pkgs.vimPlugins; [

    ];

    extraPackages = with pkgs; [

    ];
  };
}
