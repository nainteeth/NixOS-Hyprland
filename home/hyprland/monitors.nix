{ config, lib, pkgs, ... }:

let
  # Get the current hostname
  hostname = config.networking.hostName or (builtins.readFile /etc/hostname);
  
  # Define monitor configurations for different machines
  monitorConfigs = {
    # Gaming PC configuration
    "gaming-pc" = [
      "DP-1,1920x1080@240,0x0,1"      # Primary monitor: 1920x1080 at 240Hz, scale 1, position 0x0
      "DP-2,3840x2160@60,1920x0,2"    # Secondary monitor: 4K at 60Hz, scale 2, positioned to the right
    ];
    
    # Laptop configuration
    "laptop" = [
      ",preferred,auto,1"              # Auto-detect and use preferred resolution
    ];
    
    # Default fallback configuration
    "default" = [
      ",preferred,auto,1"
    ];
  };
  
  # Get the appropriate monitor config for current hostname
  currentMonitorConfig = monitorConfigs.${hostname} or monitorConfigs.default;
  
in {
  wayland.windowManager.hyprland = {
    settings = {
      monitor = currentMonitorConfig;
      
      # Optional: Add some sensible defaults for multi-monitor setups
      workspace = lib.mkIf (hostname == "gaming-pc") [
        "1, monitor:DP-1, default:true"
        "2, monitor:DP-1"
        "3, monitor:DP-1"
        "4, monitor:DP-1"
        "5, monitor:DP-1"
        "6, monitor:DP-2"
        "7, monitor:DP-2"
        "8, monitor:DP-2"
        "9, monitor:DP-2"
        "10, monitor:DP-2"
      ];
    };
  };
  
  # Optional: Debug output to see which config is being used
  home.file.".config/hyprland/monitor-debug.txt".text = ''
    Current hostname: ${hostname}
    Monitor configuration: ${builtins.toJSON currentMonitorConfig}
    Available configurations: ${builtins.toJSON (builtins.attrNames monitorConfigs)}
  '';
}
