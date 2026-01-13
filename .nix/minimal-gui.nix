{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./minimal-cli.nix
    ./hyprland.nix
    ./core-dev-tools.nix
    ./core-gui-utils.nix
  ];

  # ==========================================
  # Hostname Override
  # ==========================================
  networking.hostName = lib.mkForce "minimal-gui";

  # Virtualization (Podman with Docker compat)
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    dockerSocket.enable = true; # Often needed for tools that talk to docker socket
    defaultNetwork.settings.dns_enabled = true;
  };

  # ==========================================
  # GUI Specifics & Fonts
  # ==========================================
  
  # Essential GUI Apps and Dev Tools
  environment.systemPackages = with pkgs; [
    kitty # Terminal
    wofi  # Launcher (simpler than rofi for minimal, or keep rofi from hyprland.nix)
    
    # Browser 
    firefox 
    google-chrome
  ];
}
