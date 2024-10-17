{
    config,
    lib,
    pkgs,
    inputs,
    vars,
    ...
}:
{
    imports = lib.pipe ../modules [
        builtins.readDir
        (lib.filterAttrs (name: _: lib.hasSuffix ".nix" name))
        (lib.mapAttrsToList (name: _: ../modules + "/${name}"))
    ];

    users.users.${vars.user} = {
        shell = pkgs.fish;
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" ];
    };

    time.timeZone = "Australia/Brisbane";
    i18n = {
        defaultLocale = "en_AU.UTF-8";
    };

    security = {
        rtkit.enable = true;
        polkit.enable = true;
    };

    environment.systemPackages = with pkgs; [
        # Terminal
        git
        vim
        wget
        
        # Apps
        beeper
        bitwarden
        brave
        morgen
        obsidian
        quickemu
        vscode
        yubioath-flutter
        yubikey-manager-qt
        zeal
    ];

    programs = {
        adb.enable = true;
        dconf.enable = true;
    };

    services = {
        avahi = {
            enable = true;
            nssmdns4 = true;
            openFirewall = true;
        };
        printing = {
            drivers = [ pkgs.brlaser ];
            enable = true;
        };
        pipewire = {
            enable = true;
            alsa = {
                enable = true;
                support32Bit = true;
            };
            pulse.enable = true;
            jack.enable = true;
        };
        teamviewer.enable = true;
    };

    nix = {
        settings = {
            auto-optimise-store = true;
        trusted-substituters = [ "https://hydra.nixos.org/" ];
        };
        gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 3d";
        };
        package = pkgs.nixVersions.git;
        extraOptions = ''
            experimental-features = nix-command flakes
        '';
    };
    nixpkgs.config = {
        allowUnfree = true;
        warnUndeclaredOptions = true;
    };
    system = {
        stateVersion = "24.05";
    };

    home-manager.users.${vars.user} = {
        home = {
            stateVersion = "24.05";
            language.time = "en_AU";
        };

        programs = {
            home-manager.enable = true;
        };
    };
}