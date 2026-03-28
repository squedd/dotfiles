{inputs, self, ...}: {
  flake.nixosConfigurations.ommastrephidae = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.ommastrephidae
      inputs.jovian.nixosModules.default
    ];
  };

  flake.nixosModules.ommastrephidae = { config, pkgs, ... }: {
    imports = with self.nixosModules; [
      ommastrephidaeHardware
      localisation      
    ];

    jovian = {
      hardware = {
        has.amd.gpu = true;
      };
      steam = {
        updater.splash = "vendor";
        enable = true;
        autoStart = true;
        user = "squed";
        desktopSession = "plasma";
      };
      steamos = {
        useSteamOSConfig = true;
      };
    };

    services.handheld-daemon = {
      enable = true;
      user = "squed";
      ui.enable = true;
    };

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    networking.hostName = "ommastrephidae";
    networking.networkmanager.enable = true;
    services.xserver.enable = true;
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;
    services.xserver.xkb = {
      layout = "au";
      variant = "";
    };
    services.printing.enable = true;
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    users.users.squed = {
      isNormalUser = true;
      description = "Geoffrey Lai";
      extraGroups = [ "networkmanager" "wheel" ];
    };
    programs.firefox.enable = true;
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
      vim
      git
    ];
    system.stateVersion = "25.11";
  };
}
