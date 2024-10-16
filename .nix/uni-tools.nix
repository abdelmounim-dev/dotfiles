{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    dbeaver-bin

    # JAVA
    jetbrains.idea-ultimate
    jetbrains.jdk
  ];
}
