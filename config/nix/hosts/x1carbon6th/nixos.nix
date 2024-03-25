# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, pkgs, username, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../modules/core
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


  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "jp";
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "jp106";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."${username}" = {
    isNormalUser = true;
    extraGroups = [ 
    "networkmanager"
    "wheel"
    "audio"
    "video"
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
    };
  };

  # steam
  programs.steam = {
  	enable = true;
	remotePlay.openFirewall = true;
	dedicatedServer.openFirewall = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;


}
