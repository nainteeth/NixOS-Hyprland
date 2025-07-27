{
  description = "The best NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs"; # Ensure home-manager uses the same nixpkgs as your system
    zen-browser.url = "github:0xc000022070/zen-browser-flake"; 
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in  
  {
    nixosConfigurations = {
      # Define your host(s) here
      laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          # Import your main system configuration
          ./system/configuration.nix
          # Import the hardware configuration
          ./system/hardware-configuration.nix
          # Import Home Manager for this user
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.nainteeth = import ./home/home.nix; # Your home-manager config
          }
        ];
        specialArgs = {
            inherit inputs pkgs;        # Pass the 'inputs' set and the 'pkgs' set.
            lib = nixpkgs.lib;          # Explicitly pass the 'lib' (Nixpkgs library) set.
          };
      };
      # You can add more NixOS configurations for other machines here
      # my-desktop = nixpkgs.lib.nixosSystem { ... };
    };
  };
}
