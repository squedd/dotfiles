{
    config,
    lib,
    pkgs,
    inputs,
    vars,
    ...
}:
{
    imports = (
        import ../modules/shell ++
        import ../modules/desktops
    );

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
        sudo.wheelNeedsPassword = false;
    };

    environment = {
        systemPackages = with pkgs; [
            # Terminal
            btop
            git
            tldr
            vim
            wget
            
            # Apps
            bitwarden
            discord-canary
            firefox
            google-chrome
            obsidian
            protonmail-bridge-gui
            vscode
        ];
    };

    programs = {
        dconf.enable = true;
    };

    services = {
        printing = {
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
        };
        gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 3d";
        };
        package = pkgs.nixVersions.unstable;    # Enable Flakes
        registry.nixpkgs.flake = inputs.nixpkgs;
        extraOptions = ''
            experimental-features = nix-command flakes
            keep-outputs          = true
            keep-derivations      = true
        '';
    };
    nixpkgs.config.allowUnfree = true;
    system = {
        stateVersion = "23.11";
    };

    home-manager.users.${vars.user} = {
        home = {
            stateVersion = "23.11";
        };

        programs = {
            home-manager.enable = true;
        };
    };
}