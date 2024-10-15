{
  pkgs,
  vars,
  ...
}:
{
  imports = [ 
    ./hardware-configuration.nix
  ];
  kde.enable = true;
  steam.enable = true;

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
      efi.canTouchEfiVariables = true;
      timeout = 1;
    };
    plymouth = {
      enable = true;
      theme = "breeze";
    };
  };

  hardware = {
    graphics.enable = true;
  };
}
