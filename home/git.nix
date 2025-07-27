{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "nainteeth";
    userEmail = "knusperpommes@gmail.com" 
  }; 
}
