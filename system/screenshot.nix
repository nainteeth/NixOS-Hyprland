{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    grim          # Screenshot utility for wlroots
    slurp         # Select a region in a Wayland compositor  
    grimblast     # Combines grim + slurp with additional features
    wl-clipboard  # Wayland clipboard utilities
    swappy        # Wayland native snapshot editing tool
    satty         # Modern screenshot annotation tool
    libnotify     # For notifications
  ];
}
