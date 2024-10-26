{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    dbeaver-bin
    oracle-instantclient
    # sqldeveloper
    squirrel-sql

    # JAVA
    jetbrains.idea-ultimate
    jetbrains.jdk
    jetbrains.datagrip
  ];
}
