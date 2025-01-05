{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    gh
  ];

  programs.git = {
    enable = true;
    userName = "kirisu25";
    userEmail = "kirisu25@gmail.com";

    extraConfig = {
      core.editor = "nvim";
      color = {
        status = "auto";
        diff = "auto";
        branch = "auto";
        interactive = "auto";
        grep = "auto";
      };
      init.DefaultBranch = "main";
      ghq.root = "${config.home.homeDirectory}/src";
    };
  };

  programs.gh = {
    enable = true;
  };
}
