{ pkgs, ... }:

{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              size = "1M";
              type = "EF02";
            };
            ESP = {
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
          };
        };
      };
    };
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  hardware = {
    bluetooth.enable = true;
  };

  environment = {
    systemPackages = with pkgs; [
      curl
      file
      gcc
      git
      gnumake
      neovim
      python3
      tree
      unzip
      watch
    ];
  };

  services.getty.autologinUser = "media";

  users.users = {
    media = {
      isNormalUser = true;
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users = {
      media = {
        home = {
          stateVersion = "24.11";
        };
      };
    };
  };
}
