{ config, lib, pkgs, ... }:
{
  # X11 (needed for compatibility)
  services.xserver.enable = true; # MACH DAS NICHT AUS

  # Hyprland
  programs.hyprland.enable = true;
  
  # Hint electron apps to use wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Display Manager
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
    theme = "catppuccin-mocha";
    settings = {
      Theme = {
        Current = "catppuccin-mocha";
        CursorTheme = "Adwaita";
        CursorSize = 24;
        background = "/etc/nixos/wallpapers/blue-wave.png";
      };
      Wayland = {
        SessionDir = "${pkgs.hyprland}/share/wayland-sessions";
      };
    };
  };
  
  services.displayManager.sessionPackages = [ pkgs.hyprland ];

  # Security
  security.polkit.enable = true;

  # Flatpak
  services.flatpak.enable = true;
}
