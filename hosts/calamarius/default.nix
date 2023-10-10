{
  pkgs,
  vars,
  ...
}:
{
  imports = [ 
    ./hardware-configuration.nix
  ];
  # Desktop Module
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


  environment = {
    systemPackages = with pkgs; [
      bitwarden
      discord
      obsidian
      vscode
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

  sound.enable = true;
}
