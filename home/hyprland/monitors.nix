# monitors.nix - Returns monitor configuration based on hostname
{ config, ... }:

let
  # Get hostname from NixOS configuration
  hostname = config.networking.hostName;
  
  # Define monitor configurations for different machines
  monitorConfigs = {
    # Gaming PC configuration
    "gaming-pc" = [
      "DP-1,1920x1080@240,0x0,1"      # Primary monitor: 1920x1080 at 240Hz, scale 1, position 0x0
      "DP-2,3840x2160@60,1920x0,2"    # Secondary monitor: 4K at 60Hz, scale 2, positioned to the right
    ];
    
    # Laptop configuration
    "Laptop" = [
      ",preferred,auto,1"              # Auto-detect and use preferred resolution
    ];
    
    # Default fallback configuration
    "default" = [
      ",preferred,auto,1"
    ];
  };
  
in
# Return the appropriate monitor config for current hostname
monitorConfigs.${hostname} or monitorConfigs.default
