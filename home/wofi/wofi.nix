{ config, pkgs, ... }:
{
  programs.wofi = {
    enable = true;
    style = builtins.readFile ./style.css;
    settings = {
      width = "600";
      height = "400";
      prompt = " Run Application:";
      columns = 1;
      matching = "fuzzy";
      hide_scroll = false;
      image_size = 32;
      term = "kitty"; 
      drun-display_generic = false;
    };
  };
}
