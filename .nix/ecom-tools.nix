{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    pocketbase
  ];
}
