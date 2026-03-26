{ inputs, self, ...}: {
  flake.nixosConfigurations.sepioteuthis = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.sepioteuthis
      inputs.nixos-hardware.nixosModules.framework-13-7040-amd
    ];
  };
  flake.nixosModules.sepioteuthis = { pkgs, ... }: {
    imports = [
      self.nixosModules.sepioteuthisHardware
      self.nixosModules.commonPackages
      self.nixosModules.fish
      self.nixosModules.neovim
      self.nixosModules.vscode
      self.nixosModules.steam
      self.nixosModules.vivaldi
      self.nixosModules.localisation
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.config.allowUnfree = true;

    services = {
      acpid.enable = true;
      displayManager.autoLogin.enable = true;
      displayManager.autoLogin.user = "squed";
      flatpak.enable = true;
      fwupd.enable = true;
      hardware.bolt.enable = true;
      lact.enable = true;
      pulseaudio.enable = false;
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };
      power-profiles-daemon.enable = true;
      printing.enable = true;

      desktopManager.plasma6.enable = true;
      displayManager.sddm = {
        enable = true;
        wayland.enable = true;
      };
    };

    programs.fish.enable = true;
    networking.networkmanager.enable = true;

    security.rtkit.enable = true;
    users.users.squed = {
      isNormalUser = true;
      description = "Geoffrey Lai";
      extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
      shell = pkgs.fish;
    };

    system.stateVersion = "25.11"; # Did you read the comment?
    services.usbmuxd.enable = true;
  };
}
