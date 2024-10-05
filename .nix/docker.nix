
{ pkgs, ... }:

{
  users.groups.docker = {};
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
  users.users.ab.extraGroups = ["docker"];
}
