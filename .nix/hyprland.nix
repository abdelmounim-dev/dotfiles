{ pkgs, ... }:

{
  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
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
    }))

    # notifications
    dunst
    libnotify

    #wallpapers
    swww

    # rofi :D
    rofi

    pyprland
    hyprpicker
    hyprcursor
    hyprlock
    hypridle
    hyprpaper
    hyprpicker

    gpustat

    # wezterm
    # cool-retro-term

    starship
    # helix

    # qutebrowser
    # zathura
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
    cliphist

    # media control
    playerctl

    # disable laptop display when connected to external monitor

    # arandr equivalent for wayland
    wdisplays
    kanshi

    # logseq
  ];
}
