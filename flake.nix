{
  description = "Squed's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = { nixpkgs, ... } @inputs: {
    nixosConfigurations = {
      # laptop
      sepioteuthis = nixpkgs.lib.nixosSystem {
        specialArgs = { user = "squed"; };
        system = "x86_64-linux";
        modules = [ 
          ./nixosModules
          ./hosts/sepioteuthis/configuration.nix
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
          }    
          inputs.nixos-hardware.nixosModules.framework-13-7040-amd
        ];
      };
    };
  };
}
