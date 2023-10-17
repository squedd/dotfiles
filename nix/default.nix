{
  lib,
  inputs,
  nixpkgs,
  home-manager,
  vars,
  ...
}:

let
  system = "x86_64-linux";                                  # System Architecture
  pkgs = nixpkgs.legacyPackages.${system};
in
{
  pacman = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    extraSpecialArgs = { inherit inputs vars; };
    modules = [                                             # Modules Used
      ./pacman.nix
      {
        home = {
          username = "${vars.user}";
          homeDirectory = "/home/${vars.user}";
          packages = [ pkgs.home-manager ];
          stateVersion = "23.11";
        };
      }
    ];
  };
}