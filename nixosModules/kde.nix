{
  ...
}:
{
  programs.kdeconnect.enable = true;
  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    xserver = {
      enable = true;
      xkb.layout = "au";
      xkb.variant = "";
    };
  };
}
