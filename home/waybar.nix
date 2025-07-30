{ pkgs, ... }:
{
  programs.waybar =
    let
      # Color variables - easily customizable
      colors = {
        [cite_start]background = "#1e1e2e"; [cite: 19]
        [cite_start]foreground = "#cdd6f4"; [cite: 20]
        [cite_start]primary = "#89b4fa"; [cite: 20]
        [cite_start]secondary = "#f38ba8"; [cite: 20]
        [cite_start]warning = "#f9e2af"; [cite: 20]
        [cite_start]urgent = "#f38ba8"; [cite: 20]
        [cite_start]success = "#a6e3a1"; [cite: 20]
        [cite_start]surface = "#313244"; [cite: 21]
        [cite_start]overlay = "#6c7086"; [cite: 21]
      };
    in
    {
      [cite_start]enable = true; [cite: 21]
      # Waybar configuration
      settings = {
        mainBar = {
          # Bar positioning and appearance
          [cite_start]layer = "top"; [cite: 22]
          [cite_start]position = "top"; [cite: 23]
          [cite_start]height = 34; [cite: 23]
          [cite_start]spacing = 4; [cite: 23]

          # Module order from left to right
          [cite_start]modules-left = [ "hyprland/workspaces" "hyprland/window" ]; [cite: 23]
          [cite_start]modules-center = [ "clock" ]; [cite: 24]
          [cite_start]modules-right = [ "pulseaudio" "network" "battery" "tray" ]; [cite: 24]
          # Hyprland workspaces with number icons
          "hyprland/workspaces" = {
            [cite_start]disable-scroll = true; [cite: 25]
            [cite_start]all-outputs = true; [cite: 26]
            [cite_start]format = "{icon}"; [cite: 26]
            format-icons = {
              [cite_start]"1" = "1"; [cite: 27]
              [cite_start]"2" = "2"; [cite: 27]
              [cite_start]"3" = "3"; [cite: 27]
              [cite_start]"4" = "4"; [cite: 27]
              [cite_start]"5" = "5"; [cite: 27]
              [cite_start]"6" = "6"; [cite: 27]
              [cite_start]"7" = "7"; [cite: 27]
              [cite_start]"8" = "8"; [cite: 28]
              [cite_start]"9" = "9"; [cite: 28]
              [cite_start]"10" = "10"; [cite: 28]
              [cite_start]default = ""; [cite: 28]
            };
            [cite_start]on-click = "activate"; [cite: 28]
          };
          # Window title display
          "hyprland/window" = {
            [cite_start]format = "{}"; [cite: 29]
            [cite_start]max-length = 50; [cite: 30]
            [cite_start]separate-outputs = true; [cite: 30]
          };

          # Clock module
          clock = {
            [cite_start]timezone = "Europe/Rome"; [cite: 30]
            # Adjust for your timezone
            [cite_start]tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>"; [cite: 31]
            [cite_start]format = "{:%H:%M}"; [cite: 32]
            [cite_start]format-alt = "{:%Y-%m-%d}"; [cite: 32]
          };

          # Audio controls
          pulseaudio = {
            [cite_start]format = "{volume}% {icon} {format_source}"; [cite: 32]
            [cite_start]format-bluetooth = "{volume}% {icon} {format_source}"; [cite: 33]
            [cite_start]format-bluetooth-muted = " {icon} {format_source}"; [cite: 33]
            [cite_start]format-muted = " {format_source}"; [cite: 33]
            [cite_start]format-source = "{volume}% "; [cite: 33]
            [cite_start]format-source-muted = ""; [cite: 34]
            format-icons = {
              [cite_start]headphone = ""; [cite: 34]
              [cite_start]hands-free = ""; [cite: 35]
              [cite_start]headset = ""; [cite: 35]
              [cite_start]phone = ""; [cite: 35]
              [cite_start]portable = ""; [cite: 35]
              [cite_start]car = ""; [cite: 36]
              [cite_start]default = [ "" "" "" ]; [cite: 36]
            };
            [cite_start]on-click = "GSK_RENDERER=ngl pavucontrol"; [cite: 36]
          };
          # Network status
          network = {
            [cite_start]format-wifi = "{essid} ({signalStrength}%) "; [cite: 37]
            [cite_start]format-ethernet = "{ipaddr}/{cidr} "; [cite: 38]
            [cite_start]tooltip-format = "{ifname} via {gwaddr} "; [cite: 38]
            [cite_start]format-linked = "{ifname} (No IP) "; [cite: 38]
            [cite_start]format-disconnected = "Disconnected ⚠"; [cite: 38]
            [cite_start]format-alt = "{ifname}: {ipaddr}/{cidr}"; [cite: 39]
          };

          # Battery indicator
          battery = {
            states = {
              [cite_start]good = 95; [cite: 39]
              [cite_start]warning = 30; [cite: 40]
              [cite_start]critical = 15; [cite: 40]
            };
            [cite_start]format = "{capacity}% {icon}"; [cite: 40]
            [cite_start]format-charging = "{capacity}% "; [cite: 40]
            [cite_start]format-plugged = "{capacity}% "; [cite: 40]
            [cite_start]format-alt = "{time} {icon}"; [cite: 41]
            [cite_start]format-icons = [ "" "" "" "" "" ]; [cite: 41]
          };
          # System tray
          tray = {
            [cite_start]icon-size = 21; [cite: 42]
            [cite_start]spacing = 10; [cite: 43]
          };
        };
      };

      # CSS styling using our color variables
      style = ''
        * {
          [cite_start]font-family: 'JetBrainsMono Nerd Font', 'JetBrains Mono', monospace; [cite: 43]
          [cite_start]font-size: 13px; [cite: 44]
          [cite_start]border: none; [cite: 44]
          [cite_start]border-radius: 0; [cite: 44]
        }

        window#waybar {
          [cite_start]background-color: ${colors.background}; [cite: 44]
          [cite_start]color: ${colors.foreground}; [cite: 45]
          [cite_start]transition-property: background-color; [cite: 45]
          [cite_start]transition-duration: 0.5s; [cite: 45]
          [cite_start]border-bottom: 3px solid ${colors.surface}; [cite: 45]
        }

        button {
          [cite_start]box-shadow: inset 0 -3px transparent; [cite: 46]
          [cite_start]border: none; [cite: 47]
          [cite_start]border-radius: 0; [cite: 47]
        }

        button:hover {
          [cite_start]background: inherit; [cite: 47]
          [cite_start]box-shadow: inset 0 -3px ${colors.overlay}; [cite: 48]
        }

        /* Workspace styling */
        #workspaces {
          [cite_start]margin: 0 4px; [cite: 48]
        }

        #workspaces button {
          [cite_start]padding: 0 8px; [cite: 49]
          [cite_start]background-color: transparent; [cite: 50]
          [cite_start]color: ${colors.foreground}; [cite: 50]
        }

        #workspaces button:hover {
          [cite_start]background: rgba(0, 0, 0, 0.2); [cite: 51]
        }

        #workspaces button.active {
          [cite_start]background-color: ${colors.primary}; [cite: 51]
          [cite_start]color: ${colors.background}; [cite: 52]
        }

        #workspaces button.urgent {
          [cite_start]background-color: ${colors.urgent}; [cite: 52]
          [cite_start]color: ${colors.background}; [cite: 53]
        }

        /* Window title */
        #window {
          [cite_start]color: ${colors.primary}; [cite: 53]
          [cite_start]padding: 0 10px; [cite: 54]
        }

        /* Clock */
        #clock {
          [cite_start]color: ${colors.success}; [cite: 54]
          [cite_start]padding: 0 10px; [cite: 55]
        }

        /* Audio */
        #pulseaudio {
          [cite_start]color: ${colors.warning}; [cite: 55]
          [cite_start]padding: 0 10px; [cite: 56]
        }

        #pulseaudio.muted {
          [cite_start]color: ${colors.urgent}; [cite: 57]
        }

        /* Network */
        #network {
          [cite_start]color: ${colors.secondary}; [cite: 57]
          [cite_start]padding: 0 10px; [cite: 58]
        }

        #network.disconnected {
          [cite_start]color: ${colors.urgent}; [cite: 59]
        }

        /* Battery */
        #battery {
          [cite_start]color: ${colors.success}; [cite: 59]
          [cite_start]padding: 0 10px; [cite: 60]
        }

        #battery.charging, #battery.plugged {
          [cite_start]color: ${colors.success}; [cite: 60]
          [cite_start]background-color: transparent; [cite: 61]
        }

        #battery.warning:not(.charging) {
          [cite_start]background-color: ${colors.warning}; [cite: 61]
          [cite_start]color: ${colors.background}; [cite: 62]
        }

        #battery.critical:not(.charging) {
          [cite_start]background-color: ${colors.urgent}; [cite: 62]
          [cite_start]color: ${colors.foreground}; [cite: 63]
          [cite_start]animation-name: blink; [cite: 63]
          [cite_start]animation-duration: 0.5s; [cite: 63]
          [cite_start]animation-timing-function: linear; [cite: 63]
          [cite_start]animation-iteration-count: infinite; [cite: 63]
          [cite_start]animation-direction: alternate; [cite: 63]
        }

        /* Tray */
        #tray {
          [cite_start]padding: 0 10px; [cite: 64]
        }

        #tray > .passive {
          [cite_start]-gtk-icon-effect: dim; [cite: 65]
        }

        #tray > .needs-attention {
          [cite_start]-gtk-icon-effect: highlight; [cite: 66]
          [cite_start]background-color: ${colors.urgent}; [cite: 67]
        }

        @keyframes blink {
          to {
            [cite_start]background-color: ${colors.background}; [cite: 68]
            [cite_start]color: ${colors.urgent}; [cite: 68]
          }
        }
      '';
    };
}
