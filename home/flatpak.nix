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

    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
    ];
  };
}
