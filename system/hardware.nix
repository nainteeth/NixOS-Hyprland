{ config, lib, pkgs, ... }:
{
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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

  security.polkit.enable = true;

  hardware.opentabletdriver.enable = true;
  hardware.opentabletdriver.daemon.enable = true;
	hardware.wooting.enable = true;
	# udev rules für Wooting 60HE
	services.udev.extraRules = ''
  SUBSYSTEM=="hidraw", ATTRS{idVendor}=="31e3", MODE="0666", GROUP="input"
  SUBSYSTEM=="usb", ATTRS{idVendor}=="31e3", MODE="0666", GROUP="input"
  '';
}
