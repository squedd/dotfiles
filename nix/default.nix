{
  lib,
  inputs,
  nixpkgs,
  home-manager
  vars,
  ...
}:

let
  system = "x86_64-linux";
  pkgs = nixpkgs.legacyPackages.${system};
in
{
  pacman = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    extraSpecaialArgs = { inherit inputs vars; };
    modules = [
      ./pacman.nix
      {
        home = {
          username = "${vars.user}";
          homeDirectory = "/home/${vars.user}";
          packages = [ pkgs.home-manager ];
          stateVersion = "23.11";
        }
      }
    ];
  }
}