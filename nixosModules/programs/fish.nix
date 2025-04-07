{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    fish.enable =
      lib.mkEnableOption "Enables the Fish Shell";
  };

  config = lib.mkIf config.fish.enable {
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting
        bind -k nul -M insert 'accept-autosuggestion'
      '';
    };
  };
}