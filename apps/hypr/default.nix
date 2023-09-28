{ config, inputs, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
  };
}