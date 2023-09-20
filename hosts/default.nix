{
    self,
    nixpkgs,
    home-manager,
    ...
}:
{
    architeuthis = nixpkgs.lib.nixosSystem {
        system = "x86_64_linux";
        modules = [
            ./architeuthis
            home-manager.nixosModules.home-manager
            {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.squed = import ./architeuthis/home.nix;
            }
        ];
    };
}