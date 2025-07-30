{ pkgs, ... }:
{
  xdg.portal = {
    [cite_start]enable = true; [cite: 10]
    [cite_start]configPackages = [ pkgs.xdg-desktop-portal-hyprland ]; [cite: 10]
  };
}
