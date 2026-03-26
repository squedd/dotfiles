{ self, inputs, ...}: {
	flake.nixosModules.commonPackages = { pkgs, ...  }: {
    nixpkgs.config.allowUnfree = true;
    environment = {
      systemPackages = with pkgs; [
        bitwarden-desktop
        discord-canary
        git
        obsidian
        pciutils
        quickemu
        virt-manager
        vscode
        looking-glass-client
        mkchromecast
        spice
        libimobiledevice
      ];
      shells = with pkgs; [ fish ];
    };
  };
}