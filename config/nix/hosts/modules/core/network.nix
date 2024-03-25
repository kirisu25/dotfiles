{config, hostname, ...}:
{
  networking = {
    hostname = hostname;
    networkmanager.enable = true;
  };

  services.openssh.enable = true;

  systemd.services.NetworkManager-wait-online.enable = false;
}
