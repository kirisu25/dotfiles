{ pkgs, ... }:
let
  waybar-date = pkgs.writeScriptBin "waybar-date" ''
    date +"%y/%m/%d:%a"
  '';
in
{
  home.packages = with pkgs; [
    waybar
    waybar-date
    # (writeShellScriptBin "waybar-date" ''
    #   date +"%y/%m/%d:%a"
    # '')
  ];

  xdg.configFile."waybar/config".source = ./config;
  xdg.configFile."waybar/style.css".source = ./style.css;

}
