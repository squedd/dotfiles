{inputs, ...}: {
  options = {
    flake = inputs.flake-parts.lib.mkSubmoduleOptions {
      wrapperModules = inputs.nixpkgs.lib.mkOption {
        default = {};
      };
    };
  };

  config = {
    systems = [
      "x86_64-linux"
    ];
  };
}