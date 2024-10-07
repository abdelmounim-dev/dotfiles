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
    air
    templ
    golangci-lint
    jetbrains.goland

    # grpc tools for go
    protobuf
    protoc-gen-go
    protoc-gen-go-grpc

    python3

    tree

    redis

    rustup # needed for tools that use rust such as nil lsp
    libgcc
    gcc
    clang

    postgresql
    pgadmin4
    pgadmin4-desktopmode
    postman
    vscode-fhs
    neovim
    # zed-editor
    ripgrep

    slack
    discord
    discordo

    ghc

    mattermost-desktop
  ];
}
