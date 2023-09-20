{ config, pkgs, inputs, ... }:
let
    user = "squed";
    locale = "en_AU.UTF-8";
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

    time.timeZone = "Australia/Brisbane";

    nix = {
        settings = {
            auto-optimise-store = true;
            experimental-features = ["nix-command" "flakes"];
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
            shell = pkgs.zsh;
            isNormalUser = true;
            description = "Squid";
            extraGroups = [ "networkmanager" "wheel" ];
        };
    };
}