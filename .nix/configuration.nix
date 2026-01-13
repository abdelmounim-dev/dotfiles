{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./core.nix
    ./hardware-configuration.nix
  ];

  # ==========================================
  # Hostname
  # ==========================================
  networking.hostName = "workstation"; 

  # ==========================================
  # Users for Workstation
  # ==========================================
  users.groups.shared = { };
  users.groups.tool = { };

  users.users = {
    ab = {
      isNormalUser = true;
      description = "Abdelmounim Baouia";
      extraGroups = [ "networkmanager" "wheel" "shared" ];
      shell = pkgs.fish;
    };
    
    work = {
      isNormalUser = true;
      description = "Work";
      extraGroups = [ "networkmanager" "wheel" "shared" ];
      shell = pkgs.fish;
    };
    
    smeetz = {
      isNormalUser = true;
      description = "smeetz";
      extraGroups = [ "networkmanager" "wheel" "shared" ];
      shell = pkgs.fish;
    };
    
    tool = {
      isNormalUser = true;
      description = "tool";
      group = "tool";
      extraGroups = [ "networkmanager" "wheel" "shared" ];
      shell = pkgs.fish;
    };
  };

  systemd.tmpfiles.rules = [
    "d /home/smeetz 2770 smeetz shared -"
  ];

  # ==========================================
  # Graphics & Desktop Environment
  # ==========================================
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    xkb.layout = "us";
  };

  # Display Manager & Desktop
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Hardware acceleration
  hardware.graphics.enable = true;
  hardware.nvidia = {
    powerManagement.enable = true;
    open = false; 
    modesetting.enable = true;
  };

  # Session Variables
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };
  
  # Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  
  # ==========================================
  # Workstation Packages
  # ==========================================
  programs.firefox.enable = true;
  
  environment.systemPackages = with pkgs; [
    kitty
    netbird-ui
    xclip
  ];
}
