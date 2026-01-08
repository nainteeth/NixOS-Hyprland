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
        Context.sockets = [ "wayland" "fallback-x11" ];
        Command.append-args = [
          "--enable-features=UseOzonePlatform"
          "--ozone-platform=wayland"
          "--disable-gpu-sandbox" # Prevents the Segfault/139 crash
          "--ignore-gpu-blocklist"
          "--enable-gpu-rasterization"
          "--enable-zero-copy"
        ];
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
