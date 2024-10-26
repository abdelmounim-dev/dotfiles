{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [ factorio-demo ];
}
