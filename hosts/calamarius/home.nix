{ config, pkgs, ... }:
let
    user = "squed";
in
{
    imports = [
        ../../apps/zsh.nix
        ../../apps/starship.nix
        ../../apps/nvim.nix
        ../../apps/hypr
    ];
    home.stateVersion = "23.11";
    home.username = "${user}";
    home.homeDirectory = "/home/${user}";
    home.packages = with pkgs; [
        _1password-gui
        btop
        discord
        git
        obsidian
        tldr
        vscode
        microsoft-edge
    ];

    programs = {
        home-manager.enable = true;
        direnv = {
            enable = true;
            nix-direnv.enable = true;
        };
    };
}