{
  config,
  pkgs,
  vars,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
  ];
  kde.enable = true;

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
    opentabletdriver.enable = true;

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
    gamemode.enable = true;
    kdeconnect.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    zsh.enable = true;
  };

  services = {
    keyd.enable = true;
    xserver = {
      enable = true;
      xkb = {
        layout = "au";
        variant = "";
      };
      videoDrivers = ["amdgpu"];
    };
  };
  sound.enable = true;

  users.defaultUserShell = pkgs.zsh;
}
