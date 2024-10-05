
{ pkgs, ... }:

{

  users.users.ab.packages = with pkgs; [
    hledger
    hledger-ui
    hledger-web
    hledger-utils
  ];
}
