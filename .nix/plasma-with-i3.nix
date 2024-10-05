{ config, pkgs, lib, ... }:

{
  # Import the i3 package
  environment.systemPackages = with pkgs; [ i3 ];

  services.xserver.desktopManager.plasma5.enable = true;
  systemd.user.services = {
    plasma-run-with-i3 = {
      description = "Launch Plasma with i3";
      before = [ "plasma-workspace.target" ];
      wantedBy = [ "plasma-workspace.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.i3}/bin/i3";
        Restart = "on-failure";
      };
    };
  };
}

