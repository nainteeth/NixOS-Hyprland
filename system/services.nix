{ config, lib, pkgs, ...}:
{
  # File system services
  services.gvfs.enable = true;           # Auto-mounting, network drives
  services.udisks2.enable = true;        # Disk management
  services.devmon.enable = true;         # Device monitoring
  services.tumbler.enable = true;        # Thumbnails
  services.postgresql.enable = true; 
  virtualisation.docker.enable = true;

  security.polkit = {
  enable = true;
  extraConfig = ''
    polkit.addRule(function(action, subject) {
      if ((action.id == "org.freedesktop.udisks2.filesystem-mount-system" ||
           action.id == "org.freedesktop.udisks2.filesystem-mount") &&
          subject.isInGroup("wheel")) {
        return polkit.Result.YES;
      }
    });
  '';
  };
}
