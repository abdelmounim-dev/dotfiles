{ config, lib, pkgs, ... }:

{
  # ==========================================
  # Boot & Kernel
  # ==========================================
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # ==========================================
  # Networking
  # ==========================================
  networking.networkmanager.enable = true;
  
  # Firewall
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 443 ];
    allowedUDPPorts = [ 51820 3478 ]; 
    allowedUDPPortRanges = [
      { from = 32768; to = 61000; }
    ];
    trustedInterfaces = [ "wt0" ];
  };

  # Extra Hosts
  networking.extraHosts = ''
    3.77.166.199 vpn.smeetz.com
    3.77.166.199 vpn.anon-sce9f.domain
  '';

  # DNS / Resolved
  services.resolved = {
    enable = true;
    dnssec = "false";
    fallbackDns = [ "1.1.1.1" "8.8.8.8" ];
    extraConfig = ''
      Domains=~.
      ReadEtcHosts=yes
    '';
  };
  
  # VPN
  services.netbird.enable = true;

  # ==========================================
  # Localization
  # ==========================================
  time.timeZone = "Africa/Algiers";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  
  console.useXkbConfig = true;

  # ==========================================
  # System Packages & Programs
  # ==========================================
  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = with pkgs; [
    # Core CLI
    git
    gh
    git-credential-manager
    wget
    curl
    killall
    vim
    neovim
    htop
    
    # Containers
    distrobox
    podman

    # Utils
    pass
    nixfmt-rfc-style
  ];

  programs.zsh.enable = true;
  programs.fish.enable = true;
  
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  # SSH
  services.openssh.enable = true;
  
  # Flatpak
  services.flatpak.enable = true;

  # ==========================================
  # System Maintenance
  # ==========================================
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };
  
  system.stateVersion = "25.05"; 

  # ==========================================
  # Security / Limits
  # ==========================================
  security.pam.loginLimits = [
    { domain = "*"; item = "nofile"; type = "-"; value = "1048576"; }
    { domain = "*"; item = "nproc"; type = "-"; value = "unlimited"; }
    { domain = "*"; item = "nice"; type = "-"; value = "-20"; }
  ];
  
  systemd.services."user@".serviceConfig.Delegate = "memory pids cpu cpuset";
  systemd.settings.Manager.DefaultControllers = "cpu cpuset io memory pids";
}
