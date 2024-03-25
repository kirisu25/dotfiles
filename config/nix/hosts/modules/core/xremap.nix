{inputs, username, ...}:
{
  imports = [inputs.xremap.nixosModules.default];
  services.xremap = {
  	userName = username;
    serviceMode = "system";
    config = {
      modmap = [
        {
          name = "CapsLock is dead";
          remap = {
            CapsLock = "Ctrl_L";
          };
        }
      ];
    };
  };
}
