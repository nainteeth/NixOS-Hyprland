{
  description = "The best NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs"; # Ensure home-manager uses the same nixpkgs as your system
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      # Define your host(s) here
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux"; # Or aarch64-linux, etc.
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
      };
      # You can add more NixOS configurations for other machines here
      # my-desktop = nixpkgs.lib.nixosSystem { ... };
    };
  };
}
