{
  description = "Squed's NixOS Configuration";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs;
    home-manager.url = github:nix-community/home-manager;

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      flake = false;
    };
    doom-emacs = {
      url = "github:nix-community/nix-doom-emacs";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.emacs-overlay.follows = "emacs-overlay";
    };
  };

  outputs = {self, nixpkgs, ... }@attrs: {
    nixosConfigurations = {
      architeuthis = nixpkgs.lib.nixosSystem {
        system = "x86_64_linux";
        specialArgs = attrs;
        modules = [ ./hosts/architeuthis ];
      };
    };
  };
}