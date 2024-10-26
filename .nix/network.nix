{
  config,
  lib,
  pkgs,
  ...
}:

{
  networking.interfaces.enp8s0f3u1u2 = {
    useDHCP = false;
    ipv4.addresses = [
      {
        address = "192.168.1.128";
        prefixLength = 24;
      }
    ];
  };
}
