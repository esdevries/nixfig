{
  description = "NixTop system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
  };

  outputs = { self, nixpkgs, nixpkgs-stable, ... }@inputs:

    let
      system = "x86_64-linux";
    in {

    nixosConfigurations.nixtop = nixpkgs.lib.nixosSystem {
      specialArgs = {
        pkgs-stable = import nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };
        inherit inputs system;
      };
      modules = [
        ./nixos/configuration.nix
      ];
    };
  };
}
