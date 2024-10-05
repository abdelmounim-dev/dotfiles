{...} :
{
  # description = "My awesome nix home manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    pomoglorbo = {
      url = "git+https://codeberg.org/justusw/Pomoglorbo.git";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, pomoglorbo }: {
    # do what you must here
  };
}
