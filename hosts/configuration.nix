{
    pkgs,
    specialArgs,
    ...
}:
{
    users.users.${specialArgs.user} = {
        shell = pkgs.fish;
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" "libvirtd" ];
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
        
        # App
        beeper
        bitwarden
        bottles
        discord-canary
        google-chrome
        obsidian
        solaar
        (vivaldi.overrideAttrs
            (oldAttrs: {
                dontWrapQtApps = false;
                dontPatchELF = true;
                nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [pkgs.kdePackages.wrapQtAppsHook];
            }))
        virt-viewer
        vscode
        yubioath-flutter
        zeal
    ];

    programs = {
        appimage.binfmt = true;
        direnv.enable = true;
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
        package = pkgs.nixVersions.latest;
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

    home-manager.users.${specialArgs.user} = {
        home = {
            stateVersion = "24.05";
            language.time = "en_AU";
        };

        programs = {
            home-manager.enable = true;
        };
    };
}