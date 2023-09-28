{ config, lib, pkgs, ... }:
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
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
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
    hostName = "calamarius";
    networkmanager.enable = true;
  };

  programs = {
    hyprland = {
      xwayland.enable = true;
      enable = true;
    };
    zsh.enable = true;
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

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