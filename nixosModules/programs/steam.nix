{
    pkgs,
    ...
}:
{
    programs = {
        gamemode = {
            enable = true;
            settings = {
                gpu.gpu_device = 1;
            };
        };
        gamescope = {
            enable = true;
            capSysNice = true;
        };
        steam = {
            enable = true;
            gamescopeSession.enable = true;
            remotePlay.openFirewall = true;
            dedicatedServer.openFirewall = true;
        };
    };
}