{ inputs, nix-flatpak, ... }:

{
  imports = [
    nix-flatpak.homeManagerModules.nix-flatpak
  ];

  services.flatpak = {
    enable = true;
    uninstallUnmanaged = true;
    
    packages = [
      "com.discordapp.Discord"
      "sh.ppy.osu"
    ];

    overrides = {
      "com.discordapp.Discord" = {
        Context = {
          sockets = [ "wayland" "fallback-x11" ];
        };
        Environment = {
          # ELECTRON_OZONE_PLATFORM_HINT = "auto";
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
