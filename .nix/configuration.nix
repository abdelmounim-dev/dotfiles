# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "workstation"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # networking.nameservers = [
  #   "208.67.222.123"
  #   "208.67.220.123"
  # ];
  # networking.networkmanager.insertNameservers = [
  #   "208.67.222.123"
  #   "208.67.220.123"
  # ];
  # Set your time zone.
  time.timeZone = "Africa/Algiers";

  # Select internationalisation properties.
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

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "colemak";
  };

  console.useXkbConfig = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.groups.shared = { };
  users.users.ab = {
    isNormalUser = true;
    description = "Abdelmounim Baouia";
    extraGroups = [
      "networkmanager"
      "wheel"
      "shared"
    ];
    packages = with pkgs; [
      stow

      starship
      zoxide

      teams-for-linux
      telegram-desktop
    ];
    shell = pkgs.fish;
  };

  users.users.work = {
    isNormalUser = true;
    description = "Work User";
    extraGroups = [
      "networkmanager"
      "wheel"
      "shared"
    ]; # Adjust groups as needed
    shell = pkgs.fish;
  };

  environment.sessionVariables = {
    # If your cursor becomes invisible
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    # Opengl
    graphics.enable = true;

    # Most wayland compositors need this
    nvidia.modesetting.enable = true;
  };
  # Install firefox.
  programs.firefox.enable = true;

  # enable zsh
  programs.zsh.enable = true;

  # enable fish
  programs.fish.enable = true;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # enable flatpak
  services.flatpak.enable = true;

  # enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    # tmux
    killall

    git
    gh
    git-credential-manager

    wget
    neovim
    kitty

    xclip

    # i3
    # polybar
    # rofi
    # picom

    distrobox
    podman

    nerd-fonts.jetbrains-mono
    pass

    htop

    nixfmt-rfc-style
  ];

  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  services.pcscd.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    powerManagement.enable = true;
    open = false; # Change to true if you want the open-source driver
  };

  # disable laptop keyboard
  # services.udev.extraRules = ''
  #   ACTION=="add", SUBSYSTEM=="input", ATTRS{name}=="Asus Keyboard", ATTR{enabled}="0"
  # '';
  # cpuset
  # boot.kernelParams = [
  #   "systemd.unified_cgroup_hierarchy=0"
  # ];
  # boot.kernelModules = [ "cpuset" ];

  security.pam.loginLimits = [
    # General good defaults (adjust as needed, these are often already sufficient)
    {
      domain = "*";
      item = "nofile";
      type = "-";
      value = "1048576";
    }
    {
      domain = "*";
      item = "nproc";
      type = "-";
      value = "unlimited";
    } # Or a very large number

    # Specific attempt to allow setting higher priority (lower nice value)
    # This allows any user to renice processes to -20 (highest priority)
    # The '*' domain applies to all users. You could restrict it to your user
    # e.g., { domain = "<your_username>"; item = "nice"; type = "-"; value = "-20"; }
    # but for rootless containers to function generally, allowing it for '*' might be needed
    # if the container itself doesn't run as your specific host UID.
    {
      domain = "*";
      item = "nice";
      type = "-";
      value = "-20";
    } # Allows renicing down to -20

    # You might also need to explicitly allow real-time priority if that becomes an issue later
    # { domain = "*"; item = "rtprio"; type = "-"; value = "99"; }
  ];
  systemd.services."user@".serviceConfig.Delegate = "memory pids cpu cpuset";

  systemd.extraConfig = ''
    DefaultControllers=cpu cpuset io memory pids
  '';

}
