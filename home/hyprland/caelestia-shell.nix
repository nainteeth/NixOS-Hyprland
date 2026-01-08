{ config, terminal, fileManager, menu, browser, mainMod, ... }:

{
  # Use 'bindi' attribute for the ignore-mods flag
  bindi = [
    "${mainMod}, SPACE, global, caelestia:launcher"
  ];

  # Use 'bindl' for locked/lockscreen bindings
  bindl = [
    "${mainMod} SHIFT, N, global, caelestia:clearNotifs"
  ];

  # Standard 'bind' for everything else
  bind = [
    "${mainMod} SHIFT, E, global, caelestia:session"
    "${mainMod} SHIFT, S, global, caelestia:showall"
    "${mainMod} SHIFT, L, global, caelestia:lock"
    ", Print, global, caelestia:picker"
    "SHIFT, Print, global, caelestia:pickerFreeze"
    "${mainMod}, D, global, caelestia:dashboard"
    "${mainMod}, S, global, caelestia:sidebar"
  ];
}
