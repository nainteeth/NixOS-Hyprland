{ pkgs, ... }:
{
  programs.quickshell = {
    enable = true;
    activeConfig = "./config";
  };
}
