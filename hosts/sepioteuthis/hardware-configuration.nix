{ config, lib, pkgs, modulesPath, ... }:
{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];
  
  boot = {
    loader = {
        efi.canTouchEfiVariables = true;
        timeout = 0;
        systemd-boot = {
            enable = true;
            configurationLimit = 10;
        };
    };
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" "usb_storage" "sd_mod" ];
    };
    kernelParams = [
      "amd_iommu=on"
      "amdgpu.ppfeaturemask=0xf7fff"
      "amdgpu.dc=1"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      # "pcie_acs_override=downstream,multifunction"
    ];
    kernelModules = [ "amdgpu" ];
    blacklistedKernelModules = [ "kvm-amd" ];
    # kernelModules = [ "vfio_virqfd" "vfio_pci" "vfio_iommu_type1" "vfio" ];
    # # ADT-Link UT3G ids with dGPU
    # extraModprobeConfig = "options vfio-pci ids=1002:7590,1002:ab40";
    # postBootCommands = ''
    #   DEVS="0000:07:00.0 0000:07:00.1"

    #   for DEV in $DEVS; do
    #     echo "vfio-pci" > /sys/bus/pci/devices/$DEV/driver_override
    #   done
    #   modprobe -i vfio-pci
    # '';
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
