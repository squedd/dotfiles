{ inputs, self, ...}: {
  flake.nixosConfigurations.loligo = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.loligo
    ];
  };

  flake.nixosModules.loligo = { config, pkgs, ... }: {
    imports =
      [
        self.nixosModules.loligoHardware

        self.nixosModules.vivaldi
        self.nixosModules.fish
        self.nixosModules.nh
        self.nixosModules.vscode
        self.nixosModules.localisation
      ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelPackages = pkgs.linuxPackages_latest;
    networking.hostName = "loligo";
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
      wget
    ];
    system.stateVersion = "25.11";
  };
}
