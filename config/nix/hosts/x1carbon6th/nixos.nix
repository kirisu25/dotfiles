{ inputs, pkgs, username, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ../modules/core
      ../modules/gui
    ]
    ++(with inputs.nixos-hardware.nixosModules; [
      lenovo-thinkpad-x1-6th-gen
    ]);

    system.stateVersion = "23.11";

  # Boot
  boot = {
    loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
  };

  # Swap
  zramSwap = {
    enable = true;
    memoryPercent = 200;
  };

  # Configure console keymap
  console.keyMap = "jp106";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  user.mutableUsers = false;
  users.users."${username}" = {
    isNormalUser = true;
    hashedPassword = "$6$dlR96pEcLEZES/KE$poXpNrlqUmI3cklgw/xKWY9862zt53dy2Xngo.dzgPBPUmH5C5m2aKhMkf8K/tFOFo3jYv.Oi24y5Q.7ZjyuD0";
    extraGroups = [ 
    "networkmanager"
    "wheel"
    "audio"
    "video"
    ];
    shell = pkgs.zsh;
  };

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # xserver
  services.xserver = {
    enable = true;
    layout = "jp";
    autoRepeatDelay = 300;
    autoRepeatInterval = 30;
    libinput = {
      enable = true;
      mouse.accelProfile = "flat";
    };
  };

  # greet
  services.greetd = {
    enable = true;
    settings = {
      default_settion = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = username;
      };
    };
  };
}
