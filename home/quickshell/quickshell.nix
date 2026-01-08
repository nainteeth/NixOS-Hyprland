{ pkgs, caelestia-shell, inputs,  ... }:
{
  # programs.quickshell = {
    # enable = true;
  # };
  imports = [
    inputs.caelestia-shell.homeManagerModules.default
  ];

  programs.caelestia = {
    enable = true;
    systemd = {
      enable = true;
      target = "graphical-session.target";
      environment = [];
    };
    settings = builtins.fromJSON (builtins.readFile ./caelestia-settings.json);
    cli = {
      enable = true; 
      settings = {
        theme.enableGtk = false;
      };
    };
  };
}
