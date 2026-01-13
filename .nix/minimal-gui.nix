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
  ];

  # ==========================================
  # Hostname Override
  # ==========================================
  networking.hostName = lib.mkForce "minimal-gui";

  # ==========================================
  # GUI Specifics
  # ==========================================
  
  # Enable sound/pipewire (already in core, but good to ensure if audio is needed)
  # services.pipewire.enable = true; 

  # Essential GUI Apps for a minimal setup
  environment.systemPackages = with pkgs; [
    kitty # Terminal
    wofi  # Launcher (simpler than rofi for minimal, or keep rofi from hyprland.nix)
    
    # Browser 
    firefox 
    google-chrome

    # Tools
    antigravity-fhs
  ];
}
