{
  description = "main flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
      ...
    }@inputs:
    let
      system = "x86_64-linux";
    in
    {
            nixosConfigurations = {
              workstation = nixpkgs.lib.nixosSystem {
                inherit system;
                specialArgs = { inherit inputs; };
                modules = [
                  ./configuration.nix
                  
                  # Desktop Environment & Window Managers
                  ./hyprland.nix
                  ./xfce-i3.nix
                  
                  # Tools & Applications
                  ./dev-tools.nix
                  ./docker.nix
                  ./vms.nix
                  ./vsftpd.nix
                  ./games.nix
                  ./productivity.nix
                  ./tmux-plugins.nix
                  ./tools.nix
                  ./nerdfonts.nix
                  ./work-tools.nix
                  ./ecom-tools.nix
      
                  # Home Manager for workstation
                  home-manager.nixosModules.home-manager
                  {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.backupFileExtension = "backup";
                    home-manager.extraSpecialArgs = { inherit inputs; };
                    
                    home-manager.users.ab = import ./home/home.nix;
                    home-manager.users.work = import ./home/work.nix;
                    home-manager.users.smeetz = import ./home/smeetz.nix;
                  }
                ];
              };
              
                      minimal-cli = nixpkgs.lib.nixosSystem {
              
                        inherit system;
              
                        specialArgs = { inherit inputs; };
              
                        modules = [
              
                          ./minimal-cli.nix
              
                          ./tmux-plugins.nix
              
                          
              
                          # Home Manager for minimal
              
                          home-manager.nixosModules.home-manager
              
                          {
              
                            home-manager.useGlobalPkgs = true;
              
                            home-manager.useUserPackages = true;
              
                            home-manager.backupFileExtension = "backup";
              
                            home-manager.extraSpecialArgs = { inherit inputs; };
              
                            
              
                            # Only import the 'ab' user
              
                            home-manager.users.ab = import ./home/home.nix;
              
                          }
              
                        ];
              
                      };
              
              
              
                      minimal-gui = nixpkgs.lib.nixosSystem {
              
                        inherit system;
              
                        specialArgs = { inherit inputs; };
              
                        modules = [
              
                          ./minimal-gui.nix
              
                          ./tmux-plugins.nix
              
                          ./nerdfonts.nix
              
                          
              
                          # Home Manager for minimal
              
                          home-manager.nixosModules.home-manager
              
                          {
              
                            home-manager.useGlobalPkgs = true;
              
                            home-manager.useUserPackages = true;
              
                            home-manager.backupFileExtension = "backup";
              
                            home-manager.extraSpecialArgs = { inherit inputs; };
              
                            
              
                            # Only import the 'ab' user
              
                            home-manager.users.ab = import ./home/home.nix;
              
                          }
              
                        ];
              
                      };
              
                    };    };
}
