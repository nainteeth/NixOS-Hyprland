{ config, pkgs, ... }:

let
  # Define variables used in your Hyprland config
  terminal = "kitty";
  fileManager = "thunar";
  menu = "wofi --show drun";
  browser = "firefox";
  mainMod = "SUPER";

in
{
  wayland.windowManager.hyprland = {
    enable = true;

    # Enable XWayland for compatibility with X11 applications
    xwayland.enable = true;

    # Define your Hyprland settings
    settings = {
      ################
      ### MONITORS ###
      ################
      monitor = import ./hyprland/monitors.nix;

      #############################
      ### ENVIRONMENT VARIABLES ###
      #############################
      env = import ./hyprland/environment.nix;

      #####################
      ### LOOK AND FEEL ###
      #####################
      general = import ./hyprland/general.nix;
      decoration = import ./hyprland/decoration.nix;
      animations = import ./hyprland/animations.nix;
      dwindle = import ./hyprland/dwindle.nix;
      master = import ./hyprland/master.nix;
      misc = import ./hyprland/misc.nix;

      #############
      ### INPUT ###
      #############
      input = import ./hyprland/input.nix;
      gestures = import ./hyprland/gestures.nix;

      ###################
      ### KEYBINDINGS ###
      ###################
      "$mainMod" = mainMod;
      bind = import ./hyprland/keybinds.nix { inherit config terminal fileManager menu browser mainMod; };

      ##############################
      ### WINDOWS AND WORKSPACES ###
      ##############################
      windowrule = import ./hyprland/windowrules.nix;

      #################
      ### AUTOSTART ###
      #################
      exec-once = import ./hyprland/autostart.nix;
    };
  };
}
# Mal hoffen dass es klappt
