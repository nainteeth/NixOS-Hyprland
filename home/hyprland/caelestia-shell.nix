{ config, terminal, fileManager, menu, browser, mainMod, ... }:

[
  # Launcher - Super key tap to open
  "bindi, Super, Super_L, global, caelestia:launcher"
  
  # Launcher interrupt bindings (close launcher on other Super key actions)
  "bindin, Super, catchall, global, caelestia:launcherInterrupt"
  "bindin, Super, mouse:272, global, caelestia:launcherInterrupt"
  "bindin, Super, mouse:273, global, caelestia:launcherInterrupt"
  "bindin, Super, mouse:274, global, caelestia:launcherInterrupt"
  "bindin, Super, mouse:275, global, caelestia:launcherInterrupt"
  "bindin, Super, mouse:276, global, caelestia:launcherInterrupt"
  "bindin, Super, mouse:277, global, caelestia:launcherInterrupt"
  "bindin, Super, mouse_up, global, caelestia:launcherInterrupt"
  "bindin, Super, mouse_down, global, caelestia:launcherInterrupt"
  
  # Session menu (power options)
  "bind, ${mainMod} SHIFT, E, global, caelestia:session"
  
  # Clear notifications
  "bindl, ${mainMod} SHIFT, N, global, caelestia:clearNotifs"
  
  # Show all panels (dashboard, sidebar, etc.)
  "bind, ${mainMod} SHIFT, S, global, caelestia:showall"
  
  # Lock screen
  "bind, ${mainMod}, L, global, caelestia:lock"

  # Screenshot with caelestia picker. RIP Wofi Screenshot Update.
  "bind, , Print, global, caelestia:picker"
  "bind, SHIFT, Print, global, caelestia:pickerFreeze"
  
  # Toggle sidebar/dashboard
  "bind, ${mainMod}, D, global, caelestia:dashboard"
  "bind, ${mainMod}, S, global, caelestia:sidebar"
]
