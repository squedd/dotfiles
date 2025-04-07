{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    starship.enable =
      lib.mkEnableOption "Enables the Starship terminal prompt";
  };

  config = lib.mkIf config.starship.enable {
    programs.starship = {
      enable = true;
      settings = pkgs.lib.importTOML ../../starship.toml;
    };
  };
}