{
    lib,
    inputs,
    ...
}:
let
    commonModules = [
        ./configuration.nix
        ../nixosModules
        inputs.home-manager.nixosModules.home-manager
        {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
        }
    ];
    systemArgs = host: {
        inherit inputs;
        user = "squed";
        host.hostName = host;
    };
    laptop = "calamarius";
    laptop2 = "sepioteuthis";
in
{

    ${laptop} = lib.nixosSystem {
        specialArgs = (systemArgs laptop);
        modules = commonModules ++ [
            ./${laptop}
            inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480
        ];
    };
    ${laptop2} = lib.nixosSystem {
        specialArgs = (systemArgs laptop2);
        modules = commonModules ++ [
            ./${laptop2}
            inputs.nixos-hardware.nixosModules.framework-13-7040-amd
        ];
    };
}