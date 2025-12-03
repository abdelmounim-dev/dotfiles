{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    php
    php84Packages.composer
    git
    lazygit

    nixfmt-rfc-style

    aws-sam-cli
    awscli2
    nodejs_20

    go
    go-migrate
    gnumake
    golangci-lint
    gotools
    air
    templ

    # JAVA
    jetbrains.idea-ultimate
    jetbrains.jdk

    # grpc tools for go
    protobuf
    protoc-gen-go
    protoc-gen-go-grpc
    grpcurl

    python3
    jetbrains.pycharm-community-bin

    tree

    redis
    postgresql

    rustup # needed for tools that use rust such as nil lsp
    libgcc
    gcc
    clang

    postman
    insomnia
    vscode-fhs
    code-cursor
    windsurf
    neovim
    zed-editor
    ripgrep

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

    jq

    graphviz
  ];
}
