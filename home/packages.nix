{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    adw-gtk3
    libsForQt5.qt5ct
    qt6ct
    qt5.qtwayland
    qt6.qtwayland
    adwaita-qt
    adwaita-icon-theme
    hyprcursor
  ];
}
