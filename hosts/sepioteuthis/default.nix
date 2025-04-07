{
  pkgs,
  ...
}:
{
  imports = [ 
    ./hardware-configuration.nix
    ../../nixosModules/kde.nix
    ../../nixosModules/services/tailscale.nix
    ../../nixosModules/boot.nix
  ];

  hardware = {
    graphics.enable = true;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    logitech.wireless.enable = true;
  };

  services.teamviewer.enable = true;
}