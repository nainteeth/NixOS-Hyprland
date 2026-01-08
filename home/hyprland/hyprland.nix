{ config, pkgs, ... }:

let
  # Define variables used in your Hyprland config
  terminal = "kitty";
  fileManager = "thunar";
  menu = "wofi --show drun";
  browser = "zen-beta";
  mainMod = "SUPER";

  caelestia = import ./caelestia-shell.nix { inherit config terminal fileManager menu browser mainMod; };
  standardBinds = import ./keybinds.nix { inherit config terminal fileManager menu browser mainMod; };

in
{
  wayland.windowManager.hyprland = {
    enable = true;

    # Enable XWayland for compatibility with X11 applications
    xwayland.enable = true;

    # Define your Hyprland settings
    settings = {
      monitor = import ./monitors.nix;
      env = import ./environment.nix;
      general = import ./general.nix;
      decoration = import ./decoration.nix;
      animations = import ./animations.nix;
      dwindle = import ./dwindle.nix;
      master = import ./master.nix;
      misc = import ./misc.nix;
      input = import ./input.nix;
      gestures = import ./gestures.nix;
      "$mainMod" = mainMod;
      bind = standardBinds ++ caelestia.bind;
      windowrule = import ./windowrules.nix;
      workspaces = import ./workspaces.nix;
      exec-once = import ./autostart.nix;
    };
  };
}
# Mal hoffen dass es klappt
