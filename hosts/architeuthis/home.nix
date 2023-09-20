{ config, pkgs, ...}:
let
    user = "squed";
in
{
    programs.home-manager.enable = true;

    home.stateVersion = "23.11";
    home.username = "${user}";
    home.homeDirectory = "/home/${user}";
    home.packages = with pkgs; [
        btop
        _1password
        _1password-gui
        android-tools
        btop
        clang-tools
        discord
        gcc
        git
        go
        gnumake
        helix
        lutris
        microsoft-edge
        obsidian
        premid
        python311
        ranger
        slack
        steam
        teamviewer
        tldr
        valgrind
        vim
        vscode
        whois
        wine
        wget
    ];
}