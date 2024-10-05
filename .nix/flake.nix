{
  description = "test flake";
  
  inputs = {
      nixpkgs.url = "nixpkgs/nixos-24.05";
      home-manager.url = "github:nix-community/home-manager/release-24.05";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

  outputs = {self, nixpkgs, home-manager, ...}:
    let 
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        workstation = lib.nixosSystem {
            inherit system;
            modules = [
              ./configuration.nix
              ./hyprland.nix
              ./dev-tools.nix
              ./docker.nix
              ./productivity.nix
              ./old-pc-tools.nix
              ./xfce-i3.nix
              ./vsftpd.nix
              ./work-account.nix
              ./tmux-plugins.nix
            ];
          };
        };
      homeConfigurations = {
        ab = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [
              ./home/home.nix
            ];
          };
        };
    };
}
