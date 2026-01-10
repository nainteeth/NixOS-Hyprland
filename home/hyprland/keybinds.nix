{ config, terminal, fileManager, menu, browser, mainMod }:
# Every option that has been replaced by caelestia-shell has been marked with #c:
# See ./caelestia-shell.nix instead.

[
  "${mainMod}, RETURN, exec, ${terminal}"
  "${mainMod}, Q, killactive,"
  #c: "${mainMod} SHIFT, E, exit,"
  "${mainMod}, E, exec, ${fileManager}"
  "${mainMod}, V, togglefloating,"
  #c: "${mainMod}, SPACE, exec, ${menu}"
  "${mainMod}, P, pseudo," # dwindle
  #"${mainMod}, J, togglesplit," 
  #bind = $mainMod, J, togglesplit, # dwindle
  "${mainMod}, B, exec, ${browser}"
  "${mainMod}, F, fullscreen"
  # Move focus with mainMod + arrow keys
  "${mainMod}, H, movefocus, l"
  "${mainMod}, L, movefocus, r"
  "${mainMod}, K, movefocus, u"
  "${mainMod}, J, movefocus, d"

  "${mainMod} SHIFT, H, movewindow, l"
  "${mainMod} SHIFT, L, movewindow, r"
  "${mainMod} SHIFT, K, movewindow, u"
  "${mainMod} SHIFT, J, movewindow, d"

  # Screenshot
  # ", Print, exec, ${config.home.homeDirectory}/bin/screenshot-menu"
  # "SHIFT, Print, exec, grimblast --notify copysave screen ${config.home.homeDirectory}/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png"

  # Context-aware workspace switching (1-5 on active monitor)
  "${mainMod}, 1, exec, hyprctl dispatch workspace $(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | if .name == \"DP-1\" then 1 else 6 end')"
  "${mainMod}, 2, exec, hyprctl dispatch workspace $(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | if .name == \"DP-1\" then 2 else 7 end')"
  "${mainMod}, 3, exec, hyprctl dispatch workspace $(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | if .name == \"DP-1\" then 3 else 8 end')"
  "${mainMod}, 4, exec, hyprctl dispatch workspace $(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | if .name == \"DP-1\" then 4 else 9 end')"
  "${mainMod}, 5, exec, hyprctl dispatch workspace $(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | if .name == \"DP-1\" then 5 else 10 end')"

  # Context-aware move window to workspace (1-5 on active monitor)
  "${mainMod} SHIFT, 1, exec, hyprctl dispatch movetoworkspace $(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | if .name == \"DP-1\" then 1 else 6 end')"
  "${mainMod} SHIFT, 2, exec, hyprctl dispatch movetoworkspace $(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | if .name == \"DP-1\" then 2 else 7 end')"
  "${mainMod} SHIFT, 3, exec, hyprctl dispatch movetoworkspace $(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | if .name == \"DP-1\" then 3 else 8 end')"
  "${mainMod} SHIFT, 4, exec, hyprctl dispatch movetoworkspace $(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | if .name == \"DP-1\" then 4 else 9 end')"
  "${mainMod} SHIFT, 5, exec, hyprctl dispatch movetoworkspace $(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | if .name == \"DP-1\" then 5 else 10 end')"

  # Example special workspace (scratchpad)
  "${mainMod}, S, togglespecialworkspace, magic"
  "${mainMod} SHIFT, S, movetoworkspace, special:magic"

  # Scroll through existing workspaces with mainMod + scroll
  "${mainMod}, mouse_down, workspace, -1"
  "${mainMod} SHIFT, mouse_down, movetoworkspace, -1"
  "${mainMod}, mouse_up, workspace, +1"
  "${mainMod} SHIFT, mouse_up, movetoworkspace, +1"
  "${mainMod} CTRL, j, workspace, +1"
  "${mainMod} CTRl SHIFT, j, movetoworkspace, +1"
  "${mainMod} CTRL, k, workspace, -1"
  "${mainMod} CTRL SHIFT, k, movetoworkspace, -1"

  # Move/resize windows with mainMod + LMB/RMB and dragging
  "${mainMod}, mouse:272, mouse, movewindow" 
  "${mainMod}, mouse:273, mouse, resizewindow"

  # Laptop multiimedia keys for volume and LCD brightness
  ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
  ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
  ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
  ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
  ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
  ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"

  # Requires playerctl
  ", XF86AudioNext, exec, playerctl next"
  ", XF86AudioPause, exec, playerctl play-pause"
  ", XF86AudioPlay, exec, playerctl play-pause"
  ", XF86AudioPrev, exec, playerctl previous"
]
