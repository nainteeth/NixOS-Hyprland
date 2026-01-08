{ config, terminal, fileManager, menu, browser, mainMod, ... }:

{
  # Use 'bindi' attribute for the ignore-mods flag
  bindi = [
    "Super, Super_L, global, caelestia:launcher"
    "Super, Super_L, submap, caelestia_submap"
  ];
  extraConfig = ''
    submap = caelestia_submap

    # Launcher interrupt bindings (ONLY allowed here)
    bindin = Super, catchall, global, caelestia:launcherInterrupt
    bindin = Super, catchall, submap, reset
    
    bindin = Super, mouse:272, global, caelestia:launcherInterrupt
    bindin = Super, mouse:272, submap, reset

    # Standard keys to exit the submap
    bind = , escape, submap, reset
    
    submap = reset
  '';

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
