{ config, pkgs, ... }:
  
{
  home.username = "nainteeth";
  home.homeDirectory = "/home/nainteeth";
  home.stateVersion = "25.05";
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    adw-gtk3
    qt5ct
    qt6ct 
  ];
 
  imports = [
    ./hyprland.nix
    ./hyprpaper.nix 
  ]; 

  # Git
  programs.git = {
    enable = true;
    userName  = "nainteeth";
    userEmail = "knusperpommes@gmail.com";
  };

  # XDG Desktop Portal
  xdg.portal = {
    enable = true;
    portalPackage = pkgs.xdg-desktop-portal-gdk;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  }; 
  xdg.currentDesktop = "Hyprland";

  # Qt
  qt = {
    enable = true;
    platformTHeme = "qtct";
  }; 

  # GTK
  gtk = {
    enable = true;
    theme = {
      name = "Adw-gt3-dark";
      package pkgs.adw-gtk3;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    iconTheme = {
      name = "Adwaita";
    };
  };

  #Waybar
  programs.waybar = 
    let
      # Color variables - easily customizable
      colors = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        primary = "#89b4fa";
        secondary = "#f38ba8";
        warning = "#f9e2af";
        urgent = "#f38ba8";
        success = "#a6e3a1";
        surface = "#313244";
        overlay = "#6c7086";
      };
    in
    {
      enable = true;
      
      # Waybar configuration
      settings = {
        mainBar = {
          # Bar positioning and appearance
          layer = "top";
          position = "top";
          height = 34;
          spacing = 4;
          
          # Module order from left to right
          modules-left = [ "hyprland/workspaces" "hyprland/window" ];
          modules-center = [ "clock" ];
          modules-right = [ "pulseaudio" "network" "battery" "tray" ];
          
          # Hyprland workspaces with number icons
          "hyprland/workspaces" = {
            disable-scroll = true;
            all-outputs = true;
            format = "{icon}";
            format-icons = {
              "1" = "1";
              "2" = "2"; 
              "3" = "3";
              "4" = "4";
              "5" = "5";
              "6" = "6";
              "7" = "7";
              "8" = "8";
              "9" = "9";
              "10" = "10";
              default = "";
            };
            on-click = "activate";
          };
          
          # Window title display
          "hyprland/window" = {
            format = "{}";
            max-length = 50;
            separate-outputs = true;
          };
          
          # Clock module
          clock = {
            timezone = "Europe/Rome"; # Adjust for your timezone
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            format = "{:%H:%M}";
            format-alt = "{:%Y-%m-%d}";
          };
          
          # Audio controls
          pulseaudio = {
            format = "{volume}% {icon} {format_source}";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-bluetooth-muted = " {icon} {format_source}";
            format-muted = " {format_source}";
            format-source = "{volume}% ";
            format-source-muted = "";
            format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = [ "" "" "" ];
            };
            on-click = "GSK_RENDERER=ngl pavucontrol";
          };
          
          # Network status
          network = {
            format-wifi = "{essid} ({signalStrength}%) ";
            format-ethernet = "{ipaddr}/{cidr} ";
            tooltip-format = "{ifname} via {gwaddr} ";
            format-linked = "{ifname} (No IP) ";
            format-disconnected = "Disconnected ⚠";
            format-alt = "{ifname}: {ipaddr}/{cidr}";
          };
          
          # Battery indicator
          battery = {
            states = {
              good = 95;
              warning = 30;
              critical = 15;
            };
            format = "{capacity}% {icon}";
            format-charging = "{capacity}% ";
            format-plugged = "{capacity}% ";
            format-alt = "{time} {icon}";
            format-icons = [ "" "" "" "" "" ];
          };
          
          # System tray
          tray = {
            icon-size = 21;
            spacing = 10;
          };
        };
      };
      
      # CSS styling using our color variables
      style = ''
        * {
          font-family: 'JetBrainsMono Nerd Font', 'JetBrains Mono', monospace;
          font-size: 13px;
          border: none;
          border-radius: 0;
        }
  
        window#waybar {
          background-color: ${colors.background};
          color: ${colors.foreground};
          transition-property: background-color;
          transition-duration: 0.5s;
          border-bottom: 3px solid ${colors.surface};
        }
  
        button {
          box-shadow: inset 0 -3px transparent;
          border: none;
          border-radius: 0;
        }
  
        button:hover {
          background: inherit;
          box-shadow: inset 0 -3px ${colors.overlay};
        }
  
        /* Workspace styling */
        #workspaces {
          margin: 0 4px;
        }
  
        #workspaces button {
          padding: 0 8px;
          background-color: transparent;
          color: ${colors.foreground};
        }
  
        #workspaces button:hover {
          background: rgba(0, 0, 0, 0.2);
        }
  
        #workspaces button.active {
          background-color: ${colors.primary};
          color: ${colors.background};
        }
  
        #workspaces button.urgent {
          background-color: ${colors.urgent};
          color: ${colors.background};
        }
  
        /* Window title */
        #window {
          color: ${colors.primary};
          padding: 0 10px;
        }
  
        /* Clock */
        #clock {
          color: ${colors.success};
          padding: 0 10px;
        }
  
        /* Audio */
        #pulseaudio {
          color: ${colors.warning};
          padding: 0 10px;
        }
  
        #pulseaudio.muted {
          color: ${colors.urgent};
        }
  
        /* Network */
        #network {
          color: ${colors.secondary};
          padding: 0 10px;
        }
  
        #network.disconnected {
          color: ${colors.urgent};
        }
  
        /* Battery */
        #battery {
          color: ${colors.success};
          padding: 0 10px;
        }
  
        #battery.charging, #battery.plugged {
          color: ${colors.success};
          background-color: transparent;
        }
  
        #battery.warning:not(.charging) {
          background-color: ${colors.warning};
          color: ${colors.background};
        }
  
        #battery.critical:not(.charging) {
          background-color: ${colors.urgent};
          color: ${colors.foreground};
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
        }
  
        /* Tray */
        #tray {
          padding: 0 10px;
        }
  
        #tray > .passive {
          -gtk-icon-effect: dim;
        }
  
        #tray > .needs-attention {
          -gtk-icon-effect: highlight;
          background-color: ${colors.urgent};
        }
  
        @keyframes blink {
          to {
            background-color: ${colors.background};
            color: ${colors.urgent};
          }
        }
      '';
    };
}
