{ config, lib, pkgs, ... }:
{
  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # Networking
  networking.networkmanager.enable = true;
  networking.wireless.userControlled.enable = true;

  # Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  # Printing
  services.printing.enable = true;

  # File system services
  services.gvfs.enable = true;           # Auto-mounting, network drives
  services.udisks2.enable = true;        # Disk management
  services.devmon.enable = true;         # Device monitoring
  services.tumbler.enable = true;        # Thumbnails
}
