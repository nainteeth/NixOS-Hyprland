# home/hyprland/hyprpaper.nix
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ hyprpaper ];

  # Define the hyprpaper.conf file content
  home.file.".config/hypr/hyprpaper.conf" = {
    enable = true; # Ensure the file is created
    text = ''
      preload = ${config.home.homeDirectory}/Bilder/wallpaper/pixelart-blue.jpg
      wallpaper = ,${config.home.homeDirectory}/Bilder/wallpaper/pixelart-blue.jpg
    '';
  };

  # If I wanted to manage autostart as a systemd service through Home Manager:
  # systemd.user.services.hyprpaper = {
  #   enable = true;
  #   description = "Hyprpaper Wallpaper Setter";
  #   serviceConfig = {
  #     ExecStart = "${pkgs.hyprpaper}/bin/hyprpaper";
  #     Restart = "on-failure";
  #   };
  #   wantedBy = [ "hyprland-session.target" ]; # For Hyprland session
  # };
}
