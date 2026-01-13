# This is a placeholder for your new machine's hardware configuration.
#
# On the new machine, run:
#   nixos-generate-config --show-hardware-config > minimal-hardware.nix
#
# Then, copy the output into this file.
{ lib, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  # This is a generic configuration. Your actual hardware config will
  # likely detect specific filesystems, kernel modules, and boot options.
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-label/NIXOS_ROOT";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/BOOT";
    fsType = "vfat";
  };

  swapDevices = [ ];
}
