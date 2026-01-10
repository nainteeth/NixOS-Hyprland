{ inputs, pkgs, nix-flatpak, ... }:

{
  imports = [
    nix-flatpak.homeManagerModules.nix-flatpak
  ];

  services.flatpak = {
    enable = true;
    uninstallUnmanaged = true;
    
    packages = [
      #{ flatpakref = "https://launcher.hytale.com/builds/release/linux/amd64/hytale-launcher-latest.flatpak"; sha256="0rxbh7d9b6dap00w2sfvl0ibkhdk7mslka4l7sb2a2nh33pry4wj";}
      "com.discordapp.Discord"
      "sh.ppy.osu"
      "io.mrarm.mcpelauncher"
      "io.github.Foldex.AdwSteamGtk"
      "com.bambulab.BambuStudio"
    ];

    overrides = {
      "com.discordapp.Discord" = {
        Context.filesystems = [
          "xdg-run/pipewire-0"
        ];
        Environment.XDG_SESSION_TYPE = "wayland";
        Context.sockets = [
          "wayland"
          "x11"
          "pulseaudio"
        ];
        "Session Bus Policy" = {
          "org.freedesktop.portal.Desktop" = "talk";
        };
      };
    };
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
    ];
  };
}
