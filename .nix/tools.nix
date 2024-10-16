{ pkgs, ... }:

{

  virtualisation.waydroid.enable = true;

  services.udev.packages = with pkgs; [ vial ];
  services.udev.extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  '';
  # this is for logseq
  nixpkgs.config.permittedInsecurePackages = [ "electron-27.3.11" ];

  environment.systemPackages = with pkgs; [
    amazon-ecr-credential-helper
    clang

    curl
    drawio
    kdePackages.elisa
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

    logseq

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

    # keyboard customization
    vial

    # duh
    unzip
  ];
}
