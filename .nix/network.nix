{
  config,
  lib,
  pkgs,
  ...
}:

{
  networking = {
    interfaces.enp8s0f3u1u2 = {
      useDHCP = false;
      ipv4.addresses = [
        {
          address = "192.168.1.128";
          prefixLength = 24;
        }
      ];

    };
    # defaultGateway = {
    #   address = "192.168.1.254";
    #   interface = "enp8s0f3u1u2";
    # };
    nameservers = [ "192.168.1.64" ];
  };

}
