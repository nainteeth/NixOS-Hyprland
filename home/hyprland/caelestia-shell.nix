{ config, terminal, fileManager, menu, browser, mainMod, ... }:

{
  # Use 'bindi' attribute for the ignore-mods flag
  bindi = [
    "Super, Super_L, global, caelestia:launcher"
  ];

  # Use 'bindin' attribute for non-consuming bindings
  bindin = [
    "Super, catchall, global, caelestia:launcherInterrupt"
    "Super, mouse:272, global, caelestia:launcherInterrupt"
    "Super, mouse:273, global, caelestia:launcherInterrupt"
    "Super, mouse:274, global, caelestia:launcherInterrupt"
    "Super, mouse:275, global, caelestia:launcherInterrupt"
    "Super, mouse:276, global, caelestia:launcherInterrupt"
    "Super, mouse:277, global, caelestia:launcherInterrupt"
    "Super, mouse_up, global, caelestia:launcherInterrupt"
    "Super, mouse_down, global, caelestia:launcherInterrupt"
  ];

  # Use 'bindl' for locked/lockscreen bindings
  bindl = [
    "${mainMod} SHIFT, N, global, caelestia:clearNotifs"
  ];

  # Standard 'bind' for everything else
  bind = [
    "${mainMod} SHIFT, E, global, caelestia:session"
    "${mainMod} SHIFT, S, global, caelestia:showall"
    "${mainMod}, L, global, caelestia:lock"
    ", Print, global, caelestia:picker"
    "SHIFT, Print, global, caelestia:pickerFreeze"
    "${mainMod}, D, global, caelestia:dashboard"
    "${mainMod}, S, global, caelestia:sidebar"
  ];
}
