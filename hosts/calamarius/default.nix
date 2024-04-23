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

<<<<<<< Updated upstream
=======

  environment = {
    systemPackages = with pkgs; [
      bitwarden
      discord
      vscode
    ];
  };

>>>>>>> Stashed changes
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
