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
    security.pam.services = {
      login.u2fAuth = true;
      sudo.u2fAuth = true;
    };
    # smart card
    services.pcscd.enable = true;
    # lock screen when yubikey is unplugged
    services.udev.extraRules = ''
      ACTION=="remove",\
       ENV{ID_BUS}=="usb",\
       ENV{ID_MODEL_ID}=="0407",\
       ENV{ID_VENDOR_ID}=="1050",\
       ENV{ID_VENDOR}=="Yubico",\
       RUN+="${pkgs.systemd}/bin/loginctl lock-sessions"
    '';
  };
}