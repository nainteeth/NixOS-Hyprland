{ config, lib, pkgs, ... }:
{
  # Define user account
  users.users.nainteeth = {
    isNormalUser = true;
    description = "nainteeth";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # User-specific packages go here
    ];
  };

  # Auto-login (uncomment this to enable)
  #services.displayManager.autoLogin.enable = true;
  #services.displayManager.autoLogin.user = "nainteeth";
}
