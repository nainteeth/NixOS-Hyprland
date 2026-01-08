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
    # a smooth criminal
  };

  # Optimizing pipewire startup times
  systemd.user.services = {
  pipewire.wantedBy = [ "default.target" ];
  pipewire-pulse.wantedBy = [ "default.target" ];
  wireplumber.wantedBy = [ "default.target" ];
  };

  # Printing
  services.printing.enable = true;

  hardware.opentabletdriver.enable = true;
  hardware.opentabletdriver.daemon.enable = true;
	hardware.wooting.enable = true;
	# udev rules für Wooting 60HE
	services.udev.extraRules = ''
  SUBSYSTEM=="hidraw", ATTRS{idVendor}=="31e3", MODE="0666", GROUP="input"
  SUBSYSTEM=="usb", ATTRS{idVendor}=="31e3", MODE="0666", GROUP="input"
  '';
}
