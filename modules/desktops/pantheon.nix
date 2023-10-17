{
  config,
  lib,
  vars,
  ...
}:
with lib;
{
  options = {
    pantheon = {
      enable = mkEnableOption {
        type = types.bool;
      };
    };
  };

  config = mkIf (config.pantheon.enable) {
    programs.kdeconnect.enable = true;

    services = {
      xserver = {
        enable = true;

        layout = "au";

        displayManager.lightdm.enable = true;
        desktopManager.pantheon.enable = true;
      };
    };

    hardware.pulseaudio.enable = false;
  };
}