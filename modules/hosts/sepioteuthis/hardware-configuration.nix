{ self, inputs, ...}: {
  flake.nixosModules.sepioteuthisHardware = { config, lib, pkgs, modulesPath, ... }: {
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
      kernelPackages = pkgs.linuxPackages_latest;
      kernelParams = [
        "amdgpu.pcie_gen_cap=0x40000"
      ];
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
      cpu.amd.ryzen-smu.enable = true;
      fw-fanctrl = {
        enable = true;
        config.defaultStrategy = "lazy";
      };
      graphics = {
        enable = true;
        enable32Bit = true;
      };
      keyboard.zsa.enable = true;
    };

    fileSystems."/" =
      { device = "/dev/disk/by-uuid/5df9747e-feb1-4347-b97b-21438d9fbe93";
        fsType = "ext4";
      };

    fileSystems."/boot" =
      { device = "/dev/disk/by-uuid/50A2-BC54";
        fsType = "vfat";
        options = [ "fmask=0077" "dmask=0077" ];
      };

    swapDevices = [ ];
    
    networking.useDHCP = lib.mkDefault true;
    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}