{ pkgs, inputs, ... }:

let
  pkgs-unstable = import inputs.nixpkgs-unstable {
    inherit (pkgs) system;
    config.allowUnfree = true;
  };

  antigravity-base = pkgs-unstable.antigravity.overrideAttrs (oldAttrs: rec {
    version = "1.18.3";
    src = pkgs.fetchurl {
      url = "https://us-central1-apt.pkg.dev/projects/antigravity-auto-updater-dev/pool/antigravity-debian/antigravity_${version}-1771473975_amd64_bec6f978ba7532ab369d8234b1e87c15.deb";
      sha256 = "012czj06y8lz82g3wznxnwlr9aan9v18hi1d7ai06mrb1gd8w5w3";
    };
    nativeBuildInputs = (oldAttrs.nativeBuildInputs or [ ]) ++ [ pkgs.binutils ];
    unpackPhase = ''
      ar x $src
      tar -xvf data.tar.* --no-same-permissions --no-same-owner
    '';
    sourceRoot = "usr/share/antigravity";
  });
in
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
    antigravity-base.fhs
  ];
}