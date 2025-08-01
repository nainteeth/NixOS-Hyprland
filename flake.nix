{
  description = "The best NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/NUR";

    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs = { self, nixpkgs, home-manager, nur, nix-flatpak, spicetify-nix, ... }@inputs:
    let
      system = "x86_64-linux";
      
      # Helper function to create system configurations
      mkSystem = hostname: extraModules: nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          # Use existing system configuration
          ./system/configuration.nix
          # Host-specific hardware configuration
          ./system/hardware-configuration-${hostname}.nix
          # Home Manager integration
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.nainteeth = import ./home/home.nix;
              # Add backup extension to handle existing files
              backupFileExtension = "backup";
              # Pass all inputs to home-manager including spicetify-nix
              extraSpecialArgs = { inherit inputs nix-flatpak spicetify-nix; };
            };
            # Set hostname for each system
            networking.hostName = hostname;
          }
          ({ pkgs, ... }: {
            nixpkgs.overlays = [ nur.overlays.default ];
          })
        ] ++ extraModules;
        
        specialArgs = { inherit inputs nur nix-flatpak spicetify-nix; };
      };
    in
    {
      nixosConfigurations = {
        # Your existing laptop
        laptop = mkSystem "laptop" [];
        
        # New gaming PC configuration
        gaming-pc = mkSystem "gaming-pc" [
          # Gaming-specific configuration
          ./system/gaming.nix
        ];
      };
    };
}
