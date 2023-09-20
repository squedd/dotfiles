{
  description = "Squed's NixOS Configuration";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs;
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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

  outputs = inputs @ { self, nixpkgs, home-manager, ... }: 
    let
      user = "squed";
    in
    {
      nixosConfigurations = (
        import ./hosts {
          inherit home-manager;
        }
      );
    };
}