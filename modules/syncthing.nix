{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
{
  options = {
    syncthing = {
      enable = mkEnableOption {
        type = types.bool;
      };
    };
  };

  config = mkIf (config.syncthing.enable) {
    services.syncthing.enable = true;
  };
}