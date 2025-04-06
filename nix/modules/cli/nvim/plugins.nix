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
  lazy-nvim
  tokyonight-nvim
  lualine-nvim
  nvim-web-devicons
  plenary-nvim
  neo-tree-nvim
  nui-nvim
  nvim-autopairs
  telescope-nvim
  nvim-treesitter
  trouble-nvim
  nvim-lspconfig
  none-ls-nvim
  lspsaga-nvim
  lspkind-nvim
  luasnip
  cmp-buffer
  cmp-cmdline
  cmp-nvim-lsp
  cmp-path
  cmp_luasnip
  nvim-cmp
]
