{
  services.xserver = {
    enable = true;
    autoRepeatDelay = 300;
    autoRepeatInterval = 300;
    libinput = {
      enable = true;
      mouse.accelProfile = "flat";
    };
  };
}
