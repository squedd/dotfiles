{
    lib,
    inputs,
    nixpkgs,
    home-manager,
    hyprland,
    nixos-hardware,
    nix-doom-emacs,
    vars,
    ...
}:
let
    system = "x86_64_linux";

    pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
    };

    lib = nixpkgs.lib;
in
{
    architeuthis = lib.nixosSystem {
        inherit system;
        specialArgs = {
            inherit inputs system vars;
            host = {
                hostName = "archtieuthis";
            };
        };
        modules = [
            ./architeuthis
            ./configuration.nix

            home-manager.nixosModules.home-manager
            {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
            }
        ];
    };
    calamarius = lib.nixosSystem {
        inherit system;
        modules = [
            ./calamarius
            nixos-hardware.nixosModules.lenovo-thinkpad-t480
            home-manager.nixosModules.home-manager
            {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.${vars.user} = {
                    imports = [
                        ./calamarius/home.nix
                        hyprland.homeManagerModules.default
                    ];
                };
            }
        ];
    };
}