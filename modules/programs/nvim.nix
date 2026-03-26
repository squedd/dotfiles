{ self, inputs, ...}: {
	flake.nixosModules.neovim = { pkgs, ...  }: {
    programs.neovim.enable = true;
  };
}