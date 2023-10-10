{
  pkgs,
  vars,
  ...
}:
{
  imports = [ 
    ./hardware-configuration.nix
  ];

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
      efi.canTouchEfiVariables = true;
      timeout = 1;
    };
  };

  environment = {
    systemPackages = with pkgs; [
      discord
    ];
  };

  hardware = {
    steam-hardware.enable = true;
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  programs = {
    hyprland = {
      xwayland.enable = true;
      enable = true;
    };
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
  sound.enable = true;

  users.defaultUserShell = pkgs.zsh;
}