{ pkgs, ... }:
let
  buildInputs = with pkgs; [
    deno
    lazygit
  ];
  lsp = with pkgs; [
    # lua
    lua-language-server
    stylua
    # nix
    nil
    nixfmt-rfc-style
  ];
  parsers =
    p: with p; [
      astro
      bash
      c
      css
      dockerfile
      fish
      lua
      make
      markdown
      markdown_inline
      nix
      python
      query
      r
      ruby
      rust
      toml
      tsx
      typescript
      vim
      vimdoc
      yaml
    ];
  plugins = import ./plugins.nix { inherit pkgs; };
  configFile = file: {
    "nvim/${file}".source = pkgs.substituteAll (
      {
        src = ./. + "/${file}";
        ts_parser_dirs = pkgs.lib.pipe (pkgs.vimPlugins.nvim-treesitter.withPlugins parsers).dependencies [
          (map toString)
          (builtins.concatStringsSep ",")
        ];
      }
      // plugins
    );
  };
  configFiles = files: builtins.foldl' (x: y: x // y) { } (map configFile files);

in
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    defaultEditor = true;
    extraPackages = buildInputs ++ lsp;
  };

  xdg.configFile = configFiles [
    "./init.lua"
    "./lua/plugins/ui.lua"
  ];
}
