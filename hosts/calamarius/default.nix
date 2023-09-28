{ config, lib, pkgs, home-manager, ... }:
{
  imports = [ 
    # Include the results of the hardware scan.
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
      driSupport = true;
      driSupport32Bit = true;
    };
    pulseaudio.enable = true;
    pulseaudio.support32Bit = true;
  };

  networking = {
    hostName = "calamarius";
    networkmanager.enable = true;
  };

  programs = {
    zsh.enable = true;
  };

  security.rtkit.enable = true;

  services = {
    xserver = {
      enable = true;
      displayManager.sddm.enable = true;
      desktopManager.plasma5.enable = true;
      layout = "au";
      xkbVariant = "";
    };
  };
}