{
  pkgs,
  vars,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
  ];
  pantheon.enable = true;

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
  
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    steam-hardware.enable = true;
  };

  environment = {
    shells = with pkgs; [ zsh ];
    systemPackages = with pkgs; [
      discord
    ];
  };

  programs = {
    dconf.enable = true;
    kdeconnect.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    zsh.enable = true;
  };

  services = {
    xserver = {
      enable = true;
      layout = "au";
      xkbVariant = "";
      videoDrivers = ["nvidia"];
    };
  };
  sound.enable = true;

  users.defaultUserShell = pkgs.zsh;
}
