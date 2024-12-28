# Modified from the generated hardware configuration
# nixos-generate-config --no-filesystems --show-hardware-config
{ config, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  networking = {
    hostName = "livingroom";
  };

  nixpkgs = {
    hostPlatform = "x86_64-linux";
  };

  boot = {
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
  };

  hardware = {
    cpu = {
      amd = {
        updateMicrocode = config.hardware.enableRedistributableFirmware;
      };
    };
  };

  system = {
    stateVersion = "24.11";
  };
}
