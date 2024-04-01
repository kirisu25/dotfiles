{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    settings = {
      theme = "tokyonight";
      editor = {
        line-number = "relative";
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        mouse = false;
        auto-format = true;
        completion-replace = true;
        completion-trigger-len = 2;
        idle-timeout = 200;
        true-color = true;
        bufferline = "always";
        lsp.display-messages = true;
      };
    };

    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
      }
    ];
  };
}
