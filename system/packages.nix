{ config, lib, pkgs, ... }:
{
  # Fonts
  fonts.fontDir.enable = true;
  fonts.fontconfig.enable = true;
  fonts.packages = builtins.filter (pkg: lib.isDerivation pkg) (builtins.attrValues pkgs.nerd-fonts);

  # Programs with declarative configuration
  programs.file-roller.enable = true;    # Archive manager

  # System packages
  environment.systemPackages = with pkgs; [
    # File management
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    kdePackages.kio-admin
    unzip
    xdg-utils

    # Fonts
    inter
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji

    # Wayland/Hyprland specific
    nwg-dock-hyprland # Switch this to a home manager module to add css customization
    nwg-look
    hyprpaper
    waypaper

    # System utilities
    fastfetch
    pavucontrol
    adwaita-icon-theme
    networkmanagerapplet

    # Applications
    discord-ptb
    keepassxc
    signal-desktop
    spotify

    # Theming
    catppuccin-sddm
  ];
}
