{
  pkgs,
  ...
}:
{
  imports = [ 
    ./hardware-configuration.nix
    ../../modules/kde.nix
    ../../modules/tailscale.nix
    ../../modules/services.nix
  ];

  hardware.graphics.enable = true;
   hardware.bluetooth = {
    enable = true;
     powerOnBoot = true;
  };
}
