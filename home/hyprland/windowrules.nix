[
  "float,class:^(org.pulseaudio.pavucontrol)$"
  "float,class:^(nm-connection-editor)$"
  "float,class:^(Spotify)$,title:^(Picture in picture)$"

  # wofi bugfix
  # "noshadow,class:^(wofi)$"
  # "noborder,class:^(wofi)$"

  # opacity windowrule
  "opacity 0.65 override,class:^(kitty)$"
  "opacity 0.7 override, class:^(Thunar)$"
  "opacity 0.7 override, class:^(org.prismlauncher.PrismLauncher)$"
  "opacity 0.7 override, class:^(steam)$"
  "opacity 0.7 override, class:^(waypaper)$"
  "opacity 0.7 override, class:^(Signal)$"
  "opacity 0.7 override, class:^(net.lutris.Lutris)$"
  "opacity 0.7 override, class:^(Spotify)$"
  "opacity 0.7 override, class:^(discord)$"
  "opacity 0.7 override, class:^(org.keepassxc.KeePassXC)$"
  "opacity 1 override, class:^(zen-beta)$"

  "workspace 4, class:^(discord)$"
  "workspace 5, class:^(Spotify)$"
  "workspace 5 silent, title:^(cava)$"
  "workspace 10, class:^(steam)$"
  "workspace 10, class:^(lutris)$"
  "workspace 10, class:^(osu!)$"


  # Ignore maximize requests from apps.
  "suppressevent maximize, class:.*"

  # Fix some dragging issues with XWayland
  "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
]
