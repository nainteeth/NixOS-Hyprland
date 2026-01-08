{ config, terminal, fileManager, menu, browser, mainMod, ... }:

{
  bind = [
    "${mainMod},SPACE,global,caelestia:launcher"
    "${mainMod} SHIFT, E, global, caelestia:session"
    "${mainMod} SHIFT, S, global, caelestia:showall"
    "${mainMod} SHIFT, L, global, caelestia:lock"
    ", Print, global, caelestia:picker"
    "SHIFT, Print, global, caelestia:pickerFreeze"
    "${mainMod}, D, global, caelestia:dashboard"
    "${mainMod}, S, global, caelestia:sidebar"
  ];
}
