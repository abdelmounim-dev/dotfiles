{ pkgs, inputs, ... }:

let
  pkgs-unstable = import inputs.nixpkgs-unstable {
    inherit (pkgs) system;
    config.allowUnfree = true;
  };
in
{
  imports = [ ./core-dev-tools.nix ];

  environment.systemPackages = with pkgs; [
    php83
    php83Packages.composer
    git

    nixfmt-rfc-style

    # aws-sam-cli
    awscli2

    go-migrate
    golangci-lint
    gotools
    air
    templ

    # JAVA
    # jetbrains.idea-ultimate
    # jetbrains.jdk

    # grpc tools for go
    protobuf
    protoc-gen-go
    protoc-gen-go-grpc
    grpcurl

    # jetbrains.pycharm-community-bin

    tree

    redis
    postgresql

    rustup # needed for tools that use rust such as nil lsp
    libgcc
    clang

    postman
    insomnia
    # vscode-fhs
    pkgs-unstable.code-cursor-fhs
    windsurf
    neovim
    zed-editor

    slack
    discord

    ghc

    mongodb-compass

    minikube
    kubectl
    nginx
    kubernetes-helm

    k6
    dotenv-cli
    ngrok

    graphviz
  ];
}
