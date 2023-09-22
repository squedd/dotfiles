{
  programs = {
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;

      plugins = with pkgs.vimPlugins; [ ];

      extraConfig = ''
        syntax enable                             " Syntax highlighting
        set number                                " Set numbers
      '';
    };
  };
}