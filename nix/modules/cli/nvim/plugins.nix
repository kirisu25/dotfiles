{ pkgs, ... }:
let
  normalizedPluginAttr = p: {
    "${builtins.replaceStrings
      [
        "-"
        "."
      ]
      [
        "_"
        "_"
      ]
      (pkgs.lib.toLower p.pname)
    }" =
      p;
  };
  plugins = p: builtins.foldl' (x: y: x // y) { } (map normalizedPluginAttr p);
in
with pkgs.vimPlugins;
plugins [
  cmp-buffer
  cmp-cmdline
  cmp-nvim-lsp
  cmp-path
  cmp_luasnip
  lazy-nvim
  lspkind-nvim
  lspsaga-nvim
  lualine-nvim
  luasnip
  neo-tree-nvim
  noice-nvim
  none-ls-nvim
  nui-nvim
  nui-nvim
  nvim-autopairs
  nvim-cmp
  nvim-lspconfig
  nvim-notify
  nvim-treesitter
  nvim-web-devicons
  plenary-nvim
  telescope-nvim
  tokyonight-nvim
  trouble-nvim
]
