{
    self,
    nixpkgs,
    home-manager,
    ...
}:
let
    system = "x86_64_linux";
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
                home-manager.users.squed = import ./home.nix;
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
                home-manager.users.squed = import ./home.nix;
            }
        ];
    };
}