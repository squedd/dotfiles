{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
{
  options = {
    steam = {
      enable = mkEnableOption {
        type = types.bool;
      };
    };
  };

  config = mkIf (config.steam.enable) {
    programs.gamemode.enable = true;
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };
}