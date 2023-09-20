{ config, pkgs, user, ...}:
{
    programs.home-manager.enable = true;

    home.stateVersion = "23.05";
    home.username = "${user}";
    home.homeDirectory = "/home/${user}";
    home.packages = [
        btop
    ];
}