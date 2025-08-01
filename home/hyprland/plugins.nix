{ inputs, pkgs, ... }:

[
  # Popular Hyprland plugins - uncomment the ones you want to use
  
  # Hyprspace - Overview plugin similar to GNOME's activities
  # inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprspace
  
  # Hyprbars - Custom title bars for windows
  # inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprbars
  
  # Hyprtrails - Visual trails behind cursor/windows
  # inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprtrails
  
  # Hyprwinwrap - Allows you to run applications as wallpapers
  # inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprwinwrap
  
  # Borders-plus-plus - Enhanced border customization
  # inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.borders-plus-plus

  # You can also add custom plugins here by building them manually:
  # (pkgs.callPackage ./path/to/custom-plugin.nix { 
  #   inherit (inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}) hyprland; 
  # })
]
