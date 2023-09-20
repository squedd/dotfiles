{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "Python Shell";
  nativeBuildInputs = with pkgs; [
    (pkgs.python3.withPackages (ps: [
      ps.pip
      ps.tkinter
    ]))
  ];
  shellHook = ''
    export PIP_PREFIX=$(pwd)/_build/pip_packages
    export PYTHONPATH="$PIP_PREFIX/${pkgs.python3.sitePackages}:$PYTHONPATH"
    export PATH="$PIP_PREFIX/bin:$PATH"
    unset SOURCE_DATE_EPOCH
  '';
}