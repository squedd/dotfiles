{
    pkgs,
    ...
}:
{
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
        bitwarden
        discord-canary
        git
        obsidian
        pciutils
        (vivaldi.overrideAttrs
            (oldAttrs: {
                dontWrapQtApps = false;
                dontPatchELF = true;
                nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [pkgs.kdePackages.wrapQtAppsHook];
            })
        )
        vscode
    ];
}
