[
  "float,class:^(org.pulseaudio.pavucontrol)$"
  "float,class:^(nm-connection-editor)$"
  "float,class:^(Spotify)$,title:^(Picture in picture)$"

  # wofi bugfix
  # "noshadow,class:^(wofi)$"
  # "noborder,class:^(wofi)$"

  # opacity windowrule
  "opacity 0.65 override,class:^(kitty)$"
  "opacity 0.85 override, class:^(thunar)$"
  "opacity 0.85 override, class:^(waypaper)$"
  "opacity 0.9 override, class:^(signal)$"
  "opacity 0.9 override, class:^(Spotify)$"
  "opacity 0.9 override, class:^(com.discordapp.Discord)$"

  "workspace 10, title:^(Spotify)$"
  "workspace 5, class:^(steam_app_.*)$"
  "workspace 5, class:^(lutris)$"


  # Ignore maximize requests from apps.
  "suppressevent maximize, class:.*"

  # Fix some dragging issues with XWayland
  "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
]
