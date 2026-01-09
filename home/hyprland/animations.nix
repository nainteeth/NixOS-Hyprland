{
  enabled = "yes";
  # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
  bezier = [
    "easeOutQuint,0.23,1,0.32,1"
    "easeInOutCubic,0.65,0.05,0.36,1"
    "linear,0,0,1,1"
    "almostLinear,0.5,0.5,0.75,1.0"
    "quick,0.15,0,0.1,1"
    "overshoot, 0.05, 0.9, 0.1, 1.05"
    "fluentDecel, 0.1, 1, 0, 1"
  ];
  animation = [
    "global, 1, 6, fluentDecel"
    "workspaces, 1, 6, fluentDecel, slidevert"
    "windowsMove, 1, 2.6, overshoot"
    "windowsIn, 1, 8, fluentDecel, popin 80%"
    "windowsOut, 1, 12, fluentDecel, popin 80%"
  ];
}
