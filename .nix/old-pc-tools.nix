{ pkgs, ... }:

{

  virtualisation.waydroid.enable = true;

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
  ];
}
