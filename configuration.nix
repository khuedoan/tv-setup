{ pkgs, lib, ... }:

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

  nixpkgs = {
    config = {
      allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
        "steam"
        "steam-unwrapped"
      ];
    };
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
    loginShellInit = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
        exec gamescope --steam -- steam -tenfoot -pipewire-dmabuf
      fi
    '';
  };

  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    gamescope = {
      enable = true;
      capSysNice = true;
    };
  };

  services = {
    getty = {
      autologinUser = "tivi";
    };
  };

  security = {
    rtkit = {
      enable = true;
    };
  };

  users.users = {
    admin = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
      ];
    };
    tivi = {
      isNormalUser = true;
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users = {
      tivi = {
        home = {
          stateVersion = "24.11";
        };
      };
    };
  };

  virtualisation.vmVariant = {
    virtualisation = {
      qemu.options = [
        "-device virtio-vga-gl"
        "-display gtk,gl=on"
      ];
    };

    security = {
      sudo.wheelNeedsPassword = false;
    };
  };
}
