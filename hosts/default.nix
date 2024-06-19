{
    lib,
    inputs,
    nixpkgs,
    nur,
    home-manager,
    nixos-hardware,
    vars,
    ...
}:
let
    commonModules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        nur.nixosModules.nur
        {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
        }
    ];
    system = "x86_64_linux";
    systemArgs = host: {
        inherit inputs system vars;
        host = {
            hostName = host;
        };
    };
    pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
in
{
    architeuthis = lib.nixosSystem {
        inherit system;
        specialArgs = (systemArgs "architeuthis");
        modules = commonModules ++ [
            ./architeuthis
        ];
    };
    calamarius = lib.nixosSystem {
        inherit system;
        specialArgs = (systemArgs "calamarius");
        modules = commonModules ++ [
            ./calamarius
            nixos-hardware.nixosModules.lenovo-thinkpad-t480
        ];
    };
}