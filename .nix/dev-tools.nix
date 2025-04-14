{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    git
    lazygit

    nixfmt-rfc-style

    aws-sam-cli
    awscli2
    nodejs_20

    go
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
    vscode-fhs
    code-cursor
    neovim
    # zed-editor
    ripgrep

    slack
    discord

    ghc

    mongodb-compass
  ];
}
