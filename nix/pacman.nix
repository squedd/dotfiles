{ config, inputs, pkgs, nixgl, vars, ... }:

{
  home = {
    packages = [
      pkgs.hello
    ];
  };

  nix = {
    settings = {
      auto-optimise-store = true;
    };
    package = pkgs.nixFlakes;
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs          = true
      keep-derivations      = true
    '';
  };
  nixpkgs.config.allowUnfree = true;                    # Allow Proprietary Software.
}