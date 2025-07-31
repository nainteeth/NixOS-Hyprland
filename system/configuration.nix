{ config, lib, pkgs, inputs, ... }:
{
  imports = [
    ./hardware.nix
    ./desktop.nix
    ./system.nix
    ./packages.nix
    ./users.nix
    ./screenshot.nix
  ];

  system.stateVersion = "25.05";
}
