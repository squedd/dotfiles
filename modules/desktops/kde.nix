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
    services = {
      desktopManager.plasma6.enable = true;
      displayManager.sddm.enable = true;
      xserver = {
        enable = true;
        xkb.layout = "au";
      };
    };
  };
}
