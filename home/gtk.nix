{ pkgs, ... }:
{
  gtk = {
    [cite_start]enable = true; [cite: 13]
    theme = {
      [cite_start]name = "Adwaita-dark"; [cite: 14]
      [cite_start]package = pkgs.gnome-themes-extra; [cite: 14]
    };
    gtk3.extraConfig = {
      [cite_start]gtk-application-prefer-dark-theme = 1; [cite: 15]
    };
    gtk4.extraConfig = {
      [cite_start]gtk-application-prefer-dark-theme = 1; [cite: 16]
    };
    iconTheme = {
      [cite_start]name = "Adwaita"; [cite: 17]
      [cite_start]package = pkgs.adwaita-icon-theme; [cite: 17]
    };
    cursorTheme = {
      [cite_start]name = "Adwaita"; [cite: 18]
      [cite_start]package = pkgs.adwaita-icon-theme; [cite: 18]
    };
  };
}
