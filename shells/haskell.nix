{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
    name = "Haskell Shell";
    buildInputs = with pkgs; [
        cabal-install
        ghc
    ];

    shellHook = ''
        echo "Haskell Dev Shell Done!"
    '';
}