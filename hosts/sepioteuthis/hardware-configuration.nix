{ config, lib, pkgs, modulesPath, ... }:
{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];
  
  boot = {
    initrd = {
      availableKernelModules = [
        "thunderbolt"
        "nvme" 
        "xhci_pci"
        "usb_storage"
        "sd_mod"
        "amdgpu"
      ];
    };
    kernelModules = [
      "thunderbolt"
      "nvme" 
      "xhci_pci"
      "usb_storage"
      "sd_mod"
      "amdgpu"
    ];
    kernelPackages = pkgs.linuxPackages_zen;
    loader = {
      efi.canTouchEfiVariables = false;
      timeout = 3;
      systemd-boot = {
        enable = lib.mkDefault true;
        configurationLimit = 5;
      };
    };
  };

  hardware = {
    amdgpu = {
      opencl.enable = true;
      initrd.enable = true;
      overdrive.enable = true;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
          FastConnectable = true;
        };
        Policy = {
          AutoEnable = true;
        };
      };
    };
    fw-fanctrl = {
      enable = true;
      config.defaultStrategy = "lazy";
    };
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/d1cbd6ef-07a8-4836-b7d2-dead078bc3bb";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/3892-7248";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/8d46f0a4-841d-48ea-b7d0-e780c4f7cb59"; }
    ];

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
