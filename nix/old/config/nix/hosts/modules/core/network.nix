{config, hostname, ...}:
{
  networking = {
    hostName = hostname;
    networkmanager.enable = true;
  };

  services.openssh.enable = true;

  #systemd.services.NetworkManager-wait-online.enable = false;
}
