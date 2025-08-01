{ inputs, pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    extraPortals = [
      # Use the same package from the Hyprland flake that your system uses
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      common = {
        default = [ "hyprland" "gtk" ];
      };
      hyprland = {
        default = [ "hyprland" "gtk" ];
      };
    };
  };
}
