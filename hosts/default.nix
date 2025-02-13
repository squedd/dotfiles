{
    lib,
    inputs,
    ...
}:
let
    commonModules = [
        ./configuration.nix
        inputs.home-manager.nixosModules.home-manager
        {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
        }
    ];
    imports = lib.pipe ../modules [
        builtins.readDir
        (lib.filterAttrs (name: _: lib.hasSuffix ".nix" name))
        (lib.mapAttrsToList (name: _: ../modules + "/${name}"))
    ];
    systemArgs = host: {
        inherit inputs;
        user = "squed";
        host.hostName = host;
    };
    laptop = "calamarius";
in
{

    ${laptop} = lib.nixosSystem {
        specialArgs = (systemArgs laptop);
        modules = commonModules ++ imports ++ [
            ./${laptop}
            inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480
        ];
    };
}