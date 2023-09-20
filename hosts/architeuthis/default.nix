{ config, lib, pkgs, home-manager, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../configuration.nix
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
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    pulseaudio.enable = true;
    pulseaudio.support32Bit = true;
  };
  
  networking = {
    hostName = "architeuthis";
    networkmanager.enable = true;
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  programs = {
    dconf.enable = true;
    kdeconnect.enable = true;
    zsh.enable = true;
  };

  services = {
    xserver = {
      enable = true;
      displayManager.sddm.enable = true;
      desktopManager.plasma5.enable = true;
      layout = "au";
      xkbVariant = "";
      videoDrivers = ["nvidia"];
    };
  };
  sound.enable = true;

  users.defaultUserShell = pkgs.zsh;
}
