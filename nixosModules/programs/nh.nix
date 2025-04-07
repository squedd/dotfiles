{
    specialArgs,
    pkgs,
    lib,
    config,    
    ...
}:
{
    options = {
        nix-helper.enable = 
            lib.mkEnableOption "Enables nix helper commands.";
    };

    config = lib.mkIf config.nix-helper.enable {
        programs.nh = {
            enable = true;
            flake = "/home/${specialArgs.user}/.dotfiles/";
        };
    };

}