# /home/nainteeth/nixos-config/home/test-nvim-import.nix
{ config, pkgs, lib, testArg, ... }:
{
  options.test = lib.mkOption {
    type = lib.types.str;
    default = "default";
    description = "A test option.";
  };
  config.test = "Passed testArg: ${testArg}";
}
