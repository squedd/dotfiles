{ config, lib, pkgs, modulesPath, host, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/a4da9623-6a9e-47a0-8970-b813b883478e";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/120B-5C82";
      fsType = "vfat";
    };

  swapDevices = [ ];

  networking = with host; {
    firewall = {
      enable = true;
      allowedTCPPorts = [ 80 8080 443 24070 ];
      allowedTCPPortRanges = [
        { from = 27015; to = 27050; }
      ];
      allowedUDPPorts = [ 3478 ];
      allowedUDPPortRanges = [
        { from = 4379; to = 4380; }
        { from = 27000; to = 27100; }
      ];
    };
    useDHCP = lib.mkDefault true;
    hostName = hostName;
    networkmanager.enable = true;
  };


  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
