{ config, lib, pkgs, home-manager, ... }:
{
  imports = [ 
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  documentation = {
    enable = true;
    man.enable = true;
    dev.enable = true;
  };

  environment = {
    shells = with pkgs; [ zsh ];
  };

  hardware = {
    steam-hardware.enable = true;
    opengl = {
      driSupport = true;
      driSupport32Bit = true;
    };
    pulseaudio.enable = true;
    pulseaudio.support32Bit = true;
  };

  i18n.extraLocaleSettings = {
    defaultLocale = "en_AU.UTF-8";
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  networking = {
    hostName = "calamarius";
    networkmanager.enable = true;
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  programs = {
    kdeconnect.enable = true;
    zsh.enable = true;
  };

  security.rtkit.enable = true;

  services = {
    printing.enable = true;
    xserver = {
      enable = true;
      displayManager.sddm.enable = true;
      desktopManager.plasma5.enable = true;
      layout = "au";
      xkbVariant = "";
    };
  };

  sound.enable = true;
  system.stateVersion = "23.11";
  time.timeZone = "Australia/Brisbane";

  users = {
    defaultUserShell = pkgs.zsh;
    users.squed = {
      isNormalUser = true;
      description = "Squid";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };
}