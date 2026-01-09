{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = "0.75";
      dynamic_background_opacity = true;
    };
      extraConfig = ''
      confirm_os_window_close 0 count-background
    '';
    };
}
