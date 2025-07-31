{ config, pkgs, ... }:

let
  variables = import ./variables.nix;
  monitors = import ./monitors.nix;
  envVars = import ./env.nix;
  general = import ./general.nix;
  decoration = import ./decoration.nix;
  animations = import ./animations.nix;
  binds = import ./binds.nix;
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = monitors
      // envVars
      // general
      // decoration
      // animations
      // binds
      // variables;
  };
}
