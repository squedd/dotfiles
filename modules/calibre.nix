{
  config,
  lib,
  ...
}:
with lib;
{
  options = {
    calibre = {
      enable = mkEnableOption {
        type = types.bool;
      };
    };
  };

  config = mkIf (config.calibre.enable) {
    services = {
      calibre-server = {
        enable = true;
      };
    };
  };
}
