{ pkgs, ... }:
{
  programs.quickshell = {
    enable = true;
    activeConfig = "~/nixos/home/quickshell/config";
  };
}
