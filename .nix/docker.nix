{ pkgs, ... }:

{
  users.groups.docker = { };
  virtualisation.docker.enable = true;
  virtualisation.docker.daemon.settings = {
    dns = [
      "8.8.8.8"
      "1.1.1.1"
    ];
    mtu = 1280;
  };
  networking.firewall.trustedInterfaces = [ "docker0" ];
  virtualisation.docker.rootless = {
    enable = false;
    # setSocketVariable = true;
  };
  users.users.ab.extraGroups = [ "docker" ];
  users.users.smeetz.extraGroups = [ "docker" ];
}
