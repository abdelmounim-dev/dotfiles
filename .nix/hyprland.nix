{ pkgs, ... }:

{
  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
  };

  environment.systemPackages = with pkgs; [
    # bar
    (waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
    )

    # notifications 
    dunst
    libnotify

    #wallpapers
    swww
    
    # rofi :D
    rofi-wayland


    pyprland
    hyprpicker
    hyprcursor
    hyprlock
    hypridle
    hyprpaper

    wezterm
    cool-retro-term

    starship
    helix

    qutebrowser
    zathura
    mpv
    imv

    wlogout

    networkmanagerapplet
    brightnessctl
    # blue light filter
    wlsunset
    # screenshot
    grim
    slurp

    #clipboard
    wl-clipboard

    # media control
    playerctl

    # disable laptop display when connected to external monitor

    # arandr equivalent for wayland
    wdisplays
    kanshi
  ];
}
