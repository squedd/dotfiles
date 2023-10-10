{
  config,
  lib,
  pkgs,
  vars,
  ...
}:
with lib;
{
  options = {
    kde = {
      enable = mkEnableOption {
        type = types.bool;
      };
    };
  };

  config = mkIf (config.kde.enable) {
    services = {
      xserver = {
        enable = true;

        layout = "au";

        displayManager = {
          sddm.enable = true;
        };

        desktopManager.plasma5 = {
          enable = true;
        };
      };
    };
  };
}
