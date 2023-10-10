{
  description = "Squed's NixOS Configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    # calamarius (laptop)
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nix-doom-emacs = {
      url = "github:nix-community/nix-doom-emacs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, hyprland, nixos-hardware, nix-doom-emacs, ... } @inputs: 
  let 
    vars = {
      user = "squed";
    };
  in
  {
    nixosConfigurations = import ./hosts {
      inherit (nixpkgs) lib;
      inherit inputs nixpkgs home-manager hyprland nixos-hardware nix-doom-emacs vars;
    };
  };
}