{
    pkgs,
    lib,
    config,
    ...
}:
{
    options = {
        yazi.enable = 
            lib.mkEnableOption "Enables TUI file explorer";
    };

    config = lib.mkIf config.yazi.enable {
        programs.yazi.enable = true;
    };
}