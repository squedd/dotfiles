{
    self,
    nixpkgs,
    home-manager,
    hyprland,
    nix-doom-emacs,
    nixos-hardware,
    ...
}:
let
    system = "x86_64_linux";
    user = "squed";
    home-imports = [
        ./home.nix
        nix-doom-emacs.hmModule
    ];
in
{
    architeuthis = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
            ./architeuthis
            home-manager.nixosModules.home-manager
            {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.${user} = {
                    imports = home-imports;
                };
            }
        ];
    };
    calamarius = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
            ./calamarius
            nixos-hardware.nixosModules.lenovo-thinkpad-t480
            home-manager.nixosModules.home-manager
            {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.${user} = {
                    imports = [
                        ./calamarius/home.nix
                        hyprland.homeManagerModules.default
                    ];
                };
            }
        ];
    };
}