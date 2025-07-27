{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    extraConfig = ''
      set clipboard=unnamedplus
    '';
  };
}
