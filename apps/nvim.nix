{
  programs.neovim = {
    enable = true;
    extraConfig = ''
      syntax enable                             " Syntax highlighting
      set number                                " Set numbers
    '';
  };
}