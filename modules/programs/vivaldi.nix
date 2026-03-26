{ self, inputs, ...}: {
	flake.nixosModules.vivaldi = { pkgs, ...  }: {
    environment.systemPackages = with pkgs; [
      vivaldi
    ];
  };
}