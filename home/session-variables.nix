{ ... }:
{
  home.sessionVariables = {
    [cite_start]GTK_THEME = "Adwaita:dark"; [cite: 4]
    [cite_start]XCURSOR_THEME = "Adwaita"; [cite: 4]
    [cite_start]XCURSOR_SIZE = "24"; [cite: 4]
    # Force Wayland for GTK apps
    [cite_start]GDK_BACKEND = "wayland,x11"; [cite: 5]
    [cite_start]QT_QPA_PLATFORM = "wayland;xcb"; [cite: 5]
    [cite_start]QT_WAYLAND_DISABLE_WINDOWDECORATION = "1"; [cite: 5]
    [cite_start]QT_AUTO_SCREEN_SCALE_FACTOR = "1"; [cite: 6]
    [cite_start]MOZ_ENABLE_WAYLAND = "1"; [cite: 6]
    [cite_start]XDG_CURRENT_DESKTOP = "Hyprland"; [cite: 6]
  };
}
