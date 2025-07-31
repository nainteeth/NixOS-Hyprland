{ inputs, nix-flatpak, ... }:

{
  imports = [
    nix-flatpak.homeManagerModules.nix-flatpak
  ];

  services.flatpak = {
    enable = true;
    
    packages = [
      "com.discordapp.Discord"
      # Add other Flatpak packages here if needed
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
