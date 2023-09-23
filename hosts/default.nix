{
    self,
    nixpkgs,
    home-manager,
    ...
}:
let
    system = "x86_64_linux";
    user = "squed";
    home-imports = [
        ./home.nix
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
}