{ config, pkgs, inputs, ... }:
let
    user = "squed";
    description = "Squid";
    locale = "en_AU.UTF-8";
    stateVersion = "23.11";
    timeZone = "Australia/Brisbane";
    experimental-features = ["nix-command" "flakes"];
in
{
    documentation = {
        enable = true;
        man.enable = true;
        dev.enable = true;
    };

    i18n.extraLocaleSettings = {
        defaultLocale = "${locale}";
    };

    time = {
        inherit timeZone;
    };

    nix = {
        settings = {
            auto-optimise-store = true;
            inherit experimental-features;
        };
        gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 3d";
        };
    };
    nixpkgs.config.allowUnfree = true;

    programs.kdeconnect.enable = true;
    security.rtkit.enable = true;
    services.printing.enable = true;

    system = {
        inherit stateVersion;
    };

    users.users.${user} = {
        inherit description;
        shell = pkgs.zsh;
        isNormalUser = true;
        extraGroups = [ "networkmanager" "wheel" ];
    };
}