{ 
  config,
  lib,
  pkgs,
  ...
}:
with lib;
{
  options = {
    pam = {
      enable = mkEnableOption {
        type = types.bool;
      };
    };
  };

  config = mkIf (config.pam.enable) {
    services.udev = {
      extraRules = ''
        ACTION=="remove",\
        ENV{ID_BUS}=="usb",\
        ENV{ID_MODEL_ID}=="0407",\
        ENV{ID_VENDOR_ID}=="1050",\
        ENV{ID_VENDOR}=="Yubico",\
        RUN+="${pkgs.systemd}/bin/loginctl lock-sessions"
      '';
      packages = with pkgs; [
        pkgs.yubikey-personalization
      ];
    };
    security = {
      pam = {
        services = {
          login.u2fAuth = true;
          sudo.u2fAuth = true;
        };
        yubico = {
          enable = true;
          control = "required";
          mode = "challenge-response";
          id = [ "25466495" ];
        };
      };
    };
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}