{ config, pkgs, ... }:
let
    user = "squed";
in
{
    programs = {
        direnv = {
        enable = true;
        nix-direnv.enable = true;
        };
        home-manager.enable = true;
        starship.enable = true;
        zsh = {
            enable = true;
            syntaxHighlighting.enable = true;
            enableAutosuggestions = true;
            enableCompletion = true;
            initExtra = ''
            bindkey '^f' autosuggest-accept
            '';
        };
    };

    home.stateVersion = "23.11";
    home.username = "${user}";
    home.homeDirectory = "/home/${user}";
    home.packages = with pkgs; [
        btop
        _1password
        _1password-gui
        android-tools
        clang-tools
        discord
        direnv
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