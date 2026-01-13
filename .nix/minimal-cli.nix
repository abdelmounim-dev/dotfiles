{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./core.nix
    # This should point to the hardware configuration for your new machine.
    # Generate it with `nixos-generate-config` on the new machine and copy it here.
    ./hardware-configuration.nix
  ];

  # ==========================================
  # Hostname
  # ==========================================
  networking.hostName = "minimal-cli";

  # ==========================================
  # User for Minimal Machine
  # ==========================================
  users.users.ab = {
    isNormalUser = true;
    description = "Abdelmounim Baouia";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
  };

  # ==========================================
  # Packages for Minimal Machine
  # ==========================================
  environment.systemPackages = with pkgs; [
    # Add any extra packages for the minimal machine here
    # e.g. tmux
  ];
}
