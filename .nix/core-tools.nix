{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bat
    zoxide
    yazi
    unzip
    jq
    ripgrep
  ];
}
