{ pkgs, ... }:

{
  imports = [ ./core-tools.nix ];

  services.udev.packages = with pkgs; [ vial ];
  services.udev.extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  '';

  environment.systemPackages = with pkgs; [
    chromium
    brave
    busybox
    ncdu

    obsidian
    amazon-ecr-credential-helper
    clang

    curl
    # drawio
    feh
    ffmpeg
    jetbrains-mono
    gimp
    kdePackages.kdeconnect-kde
    nettools
    obs-studio
    polybarFull
    rPackages.telegram
    tmuxinator

    arandr
    lxappearance
    neofetch
    screenfetch
    qbittorrent

    # cli task manager
    taskwarrior3
    taskwarrior-tui

    # tui file manager
    ranger
    # mime image
    w3m
    # file manager
    # cinnamon.nemo-with-extensions

    # time logger
    rescuetime

    # screensavers
    cmatrix
    unimatrix
    pipes-rs
    pipes
    cbonsai
    neo

    # yt
    ytfzf
    ueberzugpp
    gtk-pipe-viewer

    # duh

    vlc
    amberol

    # disk usage analyzer
    baobab

    # Keyboard configuration tool
    vial
    qmk
    gcc-arm-embedded
    kmonad
    dfu-util

    ntfs3g

    yt-dlp

    stow

    telegram-desktop
    ticktick

    gnome-disk-utility

    # parental control
    malcontent
    malcontent-ui
    foliate

    caligula
  ];
}
