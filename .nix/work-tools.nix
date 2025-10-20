{ pkgs, ... }:

{
  systemd.tmpfiles.rules = [
    "d /home/work 0750 work shared -"
    "d /home/work/givesync-api 2770 work shared -"
    "Z /home/work/givesync-api 2770 work shared -"
  ];

  environment.systemPackages = with pkgs; [
    slack
    clickup
    rambox
    openvpn
  ];
}
