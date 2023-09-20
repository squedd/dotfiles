{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  name = "React-Electron-Shell";
  buildInputs = with pkgs; [
    nodePackages.create-react-app
    electron
    nodejs
    yarn
    fakeroot
    dpkg
    rpm
    patchelf
    binutils
  ];
  ELECTRON_OVERRIDE_DIST_PATH = "${pkgs.electron}/bin/"; #NEEDED to not get errors on npm start

  shellHook = ''
    echo "done"
  '';
}