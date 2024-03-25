{pkgs, pkgs-stable, ...}: {
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
      ignores = [
        ".direnv"
        ".vscode/"
        "__pycache__/"
        ".ipynv_checkpoints"
        ".venv/"
      ];
    };
  };

  programs.gh = {
    enable = true;
    package = pkgs-stable.gh;
    extensions = [
      pkgs.gh-markdown-preview
    ];
  };
}
