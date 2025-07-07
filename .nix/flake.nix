{
  description = "main flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    home-manager = {
    	url = "github:nix-community/home-manager/release-25.05";
    	inputs.nixpkgs.follows = "nixpkgs";
	};
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    zen-browser.url = "github:MarceColl/zen-browser-flake";
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
            # ./kubernetes.nix
            ./games.nix
            ./hyprland.nix
            ./productivity.nix
            ./tmux-plugins.nix
            ./tools.nix
            ./uni-tools.nix
            ./vsftpd.nix
            ./vms.nix
            ./nerdfonts.nix
            ./xfce-i3.nix
            ./network.nix
            # ./work-account.nix
            { environment.systemPackages = with pkgs; [ hyprpanel ]; }
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.ab = import ./home/home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
          }];
        };
      };
      # homeConfigurations = {
      #   ab = home-manager.lib.homeManagerConfiguration {
      #     inherit pkgs;
      #     modules = [ ./home/home.nix ];
      #   };
      # };
    };
}
