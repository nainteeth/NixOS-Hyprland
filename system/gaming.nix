{ config, pkgs, ... }:
{
  # Gaming packages and optimizations
  programs.steam.enable = true;
  programs.gamemode.enable = true;
  
  # AMD GPU support for RX 6700XT
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      amdvlk
      rocm-opencl-icd
      rocm-opencl-runtime
    ];
  };
  
  # AMD GPU driver
  services.xserver.videoDrivers = [ "amdgpu" ];
  
  # Performance tweaks for gaming
  boot.kernel.sysctl = {
    "vm.max_map_count" = 2147483642;  # For some games
  };
  
  # Additional gaming packages
  environment.systemPackages = with pkgs; [
    mangohud
    gamescope
    lutris
    pkgs.osu-lazer-bin
    vulkan-tools
    vulkan-validation-layers
  ];
}
