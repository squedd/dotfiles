{
    lib,
    ...
}:
{
    imports = [
        ./programs/fish.nix
        ./programs/nh.nix
        ./programs/starship.nix
        ./programs/yazi.nix
    ];

    fish.enable = lib.mkDefault true;
    nix-helper.enable = lib.mkDefault true;
    starship.enable = lib.mkDefault true;
    yazi.enable = lib.mkDefault true;
}
