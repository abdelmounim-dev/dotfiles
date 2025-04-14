{
  description = "main flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    zen-browser.url = "github:MarceColl/zen-browser-flake";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      zen-browser,
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
            ./dev-tools.nix
            ./docker.nix
            ./games.nix
            ./hyprland.nix
            ./productivity.nix
            ./tmux-plugins.nix
            ./tools.nix
            ./uni-tools.nix
            ./vsftpd.nix
            ./vms.nix
            ./xfce-i3.nix
            # ./network.nix
            # ./work-account.nix
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
