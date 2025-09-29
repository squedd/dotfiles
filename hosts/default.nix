{
    inputs,
    ...
}:
let
    lib = inputs.nixpkgs.lib;
    commonModules = [
        inputs.home-manager.nixosModules.home-manager
        {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
        }
        inputs.nixos-cli.nixosModules.nixos-cli
        ../nixosModules
    ];
    systemArgs = host: {
        inherit inputs;
        user = "squed";
        host.hostName = host;
    };
    laptop = "sepioteuthis";
in
{
    ${laptop} = lib.nixosSystem {
        specialArgs = (systemArgs laptop);
        modules = commonModules ++ [
            ./${laptop}
            inputs.nixos-hardware.nixosModules.framework-13-7040-amd
        ];
    };
}
