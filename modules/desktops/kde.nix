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
      enable = mkOption {
        type = types.bool;
        default = false;
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
