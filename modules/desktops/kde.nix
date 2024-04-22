{
  config,
  lib,
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
    programs = {
      kdeconnect = {
        enable = true;
      };
    };

    services = {
      xserver = {
        enable = true;
        xkb.layout = "au";

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
