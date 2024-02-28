{pkgs, pkgs-stable, ...}: {
  programs.git = {
    enable = true;
    userName = "kirisu25";
    userEmail = "kirisu25@gmail.com";
  };

  programs.gh = {
    enable = true;
    package = pkgs-stable.gh;
    extensions = [
      pkgs.gh-markdown-preview
    ];
  };
}
