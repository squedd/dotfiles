{
  lib,
  config,
}:
{
  options = {
    neovim.enable =
      lib.mkEnableOption "Enables text editor";
  };

  config = lib.mkIf config.neovim.enable {
    programs.nvim.enable = true;
  };
}