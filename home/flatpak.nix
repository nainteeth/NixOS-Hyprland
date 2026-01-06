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
      # "org.signal.Signal"
      # "com.spotify.Client"
    ];
    
    # Optional: configure remotes
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
    ];
  };
}
