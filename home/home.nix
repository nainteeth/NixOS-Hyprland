{ config, pkgs, lib, ... }:
{
  home.username = "nainteeth";
  home.homeDirectory = "/home/nainteeth";
  home.stateVersion = "25.05";
  fonts.fontconfig.enable = true;
 
  imports = [
    ./hyprland/hyprland.nix
    ./packages.nix
    ./session-variables.nix
    ./dconf-settings.nix
    ./xdg-portal.nix
    ./qt.nix
    ./gtk.nix
    ./waybar.nix
    ./kitty.nix
    ./wofi/wofi.nix
    ./git.nix
    ./nvim.nix
    ./screenshot.nix
    ./firefox.nix
    ./flatpak.nix
  ];
}
