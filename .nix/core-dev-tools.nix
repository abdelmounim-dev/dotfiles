{ pkgs, ... }:

{
  imports = [ ./core-tools.nix ];

  environment.systemPackages = with pkgs; [
    # Development
    go
    nodejs_20
    python3
    lazygit
    gnumake
    gcc
    podman-compose
    antigravity-fhs
  ];
}