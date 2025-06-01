{
  description = "Squed's NixOS Configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    xremap-flake.url = "github:xremap/nix-flake";

  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, xremap-flake, ... } @inputs: 
  {
    nixosConfigurations = (
      import ./hosts {
        inherit inputs;
        inherit (nixpkgs) lib;
      }
    );
  };
}