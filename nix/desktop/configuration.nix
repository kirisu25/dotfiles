# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  inputs,
  config,
  pkgs,
  ...
}:

{
  imports =
    [
      ./hardware-configuration.nix
    ]
    ++ (with inputs.nixos-hardware.nixosModules; [
      common-pc-ssd
      common-cpu-amd
      # common-gpu-nvidia
    ]);

  system.stateVersion = "24.05"; # Did you read the comment?

  # kernel
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # gup
  hardware.graphics = {
    enable = true;
  };

  # Load nvidia driver for Xorg & Wayland
  services.xserver.videoDrivers = [ "nvidia" ];

  # hardware.nvidia = {
  #   # prime = {
  #   #   nvidiaBusId = "PCI:2:B:0";
  #   # };
  #   modesetting.enable = true;
  #   nvidiaSettings = true;
  #   open = false;
  #   powerManagement.enable = false;
  #   package = config.boot.kernelPackages.nvidiaPackages.stable;
  # };

  networking.hostName = "deskt"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";

  # Select internationalisation properties.
  i18n.defaultLocale = "ja_JP.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ja_JP.UTF-8";
    LC_IDENTIFICATION = "ja_JP.UTF-8";
    LC_MEASUREMENT = "ja_JP.UTF-8";
    LC_MONETARY = "ja_JP.UTF-8";
    LC_NAME = "ja_JP.UTF-8";
    LC_NUMERIC = "ja_JP.UTF-8";
    LC_PAPER = "ja_JP.UTF-8";
    LC_TELEPHONE = "ja_JP.UTF-8";
    LC_TIME = "ja_JP.UTF-8";
  };

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = [ pkgs.fcitx5-mozc ];
  };

  fonts.packages = with pkgs; [
    noto-fonts-cjk-serif
    noto-fonts-cjk-sans
    noto-fonts-emoji
    nerd-fonts.noto
    nerd-fonts.jetbrains-mono
    hackgen-nf-font
  ];
  fonts = {
    fontDir.enable = true;
    fontconfig.enable = true;
    fontconfig = {
      defaultFonts = {
        serif = [
          "Noto Serif CJK JP"
          "Noto Color Emoji"
        ];
        sansSerif = [
          "Noto Sans CJK JP"
          "Noto Color Emoji"
        ];
        monospace = [
          "JetBrainsMono Nerd Font"
          "Noto Color Emoji"
        ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };

  xdg.portal.enable = true;

  # xserver
  services.xserver = {
    enable = true;
    autoRepeatDelay = 300;
    autoRepeatInterval = 30;
  };

  # hyprland
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    wireplumber = {
      enable = true;
      package = pkgs.wireplumber;
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kirisu25 = {
    isNormalUser = true;
    description = "kirisu25";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

  programs = {
    git = {
      enable = true;
    };

    neovim = {
      enable = true;
      defaultEditor = true;
    };

    starship = {
      enable = true;
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
    };

    firefox = {
      enable = true;
    };

    nix-ld.enable = true;

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };
  # font override to steam
  nixpkgs.config.packageOverrides = pkgs: {
    steam = pkgs.steam.override {
      extraPkgs =
        pkgs: with pkgs; [
          migu
        ];
    };
  };

  # Docker
  virtualisation = {
    docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    helix
    kitty
    wofi
    pavucontrol
    mako
    linuxKernel.packages.linux_zen.xone
    wineWowPackages.stable
    # wineWowPackages.waylandFull
    winetricks
    wget
  ];

  # xbox wireless usb dongle
  hardware.xone.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = ''
          				${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland
          			'';
      };
    };
  };

}
