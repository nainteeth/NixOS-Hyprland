{ config, terminal, fileManager, menu, browser, mainMod, ... }:

{
  bind = [
    "${mainMod},SPACE,global,caelestia:launcher"
    "${mainMod} SHIFT, E, global, caelestia:session"
    "${mainMod} SHIFT, S, global, caelestia:showall"
    "${mainMod} Ctrl, L, global, caelestia:lock"
    ", Print, global, caelestia:screenshot"
    "SHIFT, Print, global, caelestia:screenshot -h"
    "${mainMod}, D, global, caelestia:dashboard"
    "${mainMod}, S, global, caelestia:sidebar"
  ];
}
