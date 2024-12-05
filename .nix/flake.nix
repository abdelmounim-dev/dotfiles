{
  description = "main flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ inputs.hyprpanel.overlay ];
      };
    in
    {
      nixosConfigurations = {
        workstation = lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            # ./network.nix
            ./hyprland.nix
            ./dev-tools.nix
            ./docker.nix
            ./productivity.nix
            ./tools.nix
            ./xfce-i3.nix
            ./vsftpd.nix
            # ./work-account.nix
            ./tmux-plugins.nix
            ./uni-tools.nix
            ./games.nix
            { environment.systemPackages = with pkgs; [ hyprpanel ]; }
          ];
        };
      };
      homeConfigurations = {
        ab = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home/home.nix ];
        };
      };
    };
}
