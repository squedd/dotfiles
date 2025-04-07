{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    thefuck.enable =
      lib.mkEnableOption "Enables command autocorrect";
  };

  config = lib.mkIf config.thefuck.enable {
    programs.thefuck = {
        enable = true;
        alias = "oof";
    };
  };
}