{
  description = "Squed's NixOS Configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-cli.url = "github:nix-community/nixos-cli";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    xremap-flake.url = "github:xremap/nix-flake";
  };

  outputs = inputs@ {self, nixpkgs, ...}:
  {
    nixosConfigurations = (
      import ./hosts {
        inherit (self) inputs outputs;
      }
    );
  };
}
