{ pkgs, specialArgs, home-manager, lib, config, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  services = {
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
    teamviewer.enable = true;
    # tailscale.enable = true;
    # macos-ventura = {
      #   enable = true;
      #   cores = 1;
      #   threads = 2;
      #   mem = "16G";
      #   openFirewall = true;
      #   vncListenAddr = "0.0.0.0";
      #   # todo for eGPU passthrough
      #   extraQemuFlags = [
      #   ];
      # }; 
    # };
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

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.05"; # Did you read the comment?
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # sidetracked config
  home-manager.users.squed = {
    home.stateVersion = "25.11";
    programs.fish = {
      enable = true;
    };
  };

  # turning off auto-suspend
  systemd = {
    services = {
      systemd-suspend.environment.SYSTEMD_SLEEP_FREEZE_USER_SESSIONS = "false";
      systemd-hibernate.environment.SYSTEMD_SLEEP_FREEZE_USER_SESSIONS = "false";
      systemd-suspend-then-hibernate.environment.SYSTEMD_SLEEP_FREEZE_USER_SESSIONS = "false";
      systemd-hybrid-sleep.environment.SYSTEMD_SLEEP_FREEZE_USER_SESSIONS = "false";
    };
  };
}
