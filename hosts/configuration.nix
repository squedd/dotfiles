{ config, pkgs, inputs, ... }:
let
    user = "squed";
    description = "Squid";
    locale = "en_AU.UTF-8";
    timeZone = "Australia/Brisbane";
    experimental-features = ["nix-command" "flakes"];
in
{
    i18n.extraLocaleSettings = {
        defaultLocale = "${locale}";
        LC_ADDRESS = "${locale}";
        LC_IDENTIFICATION = "${locale}";
        LC_MEASUREMENT = "${locale}";
        LC_MONETARY = "${locale}";
        LC_NAME = "${locale}";
        LC_NUMERIC = "${locale}";
        LC_PAPER = "${locale}";
        LC_TELEPHONE = "${locale}";
        LC_TIME = "${locale}";
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
            options = "--deleted-older-than 3d";
        };
    };
    nixpkgs.config.allowUnfree = true;

    security.rtkit.enable = true;

    services = {
        printing.enable = true;
    };

    system.stateVersion = "23.11";

    users = {
        users.${user} = {
            inherit description;
            shell = pkgs.zsh;
            isNormalUser = true;
            extraGroups = [ "networkmanager" "wheel" ];
        };
    };
}