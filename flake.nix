{
  description = "The best NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
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
            };
            # Set hostname for each system
            networking.hostName = hostname;
          }
        ] ++ extraModules;
        
        specialArgs = { inherit inputs; };
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
