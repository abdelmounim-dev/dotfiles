{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    slack
    clickup
    rambox
  ];
}
