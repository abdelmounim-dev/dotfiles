{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    amazon-ecr-credential-helper
    clang
    cmatrix
    unimatrix

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
];
}
