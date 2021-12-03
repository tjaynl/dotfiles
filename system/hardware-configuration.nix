# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "uas" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/84d27ca8-eaf7-4209-9d75-21fc7fd61db5";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/13AD-CAEB";
      fsType = "vfat";
    };

  swapDevices = [ ];

  fileSystems."/games/ssd" =
    { device = "/dev/disk/by-uuid/5820e557-3f4f-45e9-8c19-419c038ef696";
      fsType = "ext4";
      options = [ "defaults" "rw" ];
    };
  fileSystems."/games/hdd" =
    { device = "dev/disk/by-uuid/07780d2a-9e39-4e92-958f-7d8321c46a0f";
      fsType = "ext4";
      options = [ "defaults" "rw" ];
    };
}
