{

  description = "My First Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    # home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {

    nixosConfigurations = {
      "goodmorninghwt" = lib.nixosSystem {
        # system = "x86_64-linux";
        inherit system;
        modules = [ ./profiles/nixos/configuration.nix];
      };

      "hwt-wsl-nixos" = lib.nixosSystem {
        inherit system;
        modules = [ ./profiles/hwt-wsl-nixos/configuration.nix];
      };
    };


    homeConfigurations = {
      "goodmorninghwt" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./profiles/nixos/home.nix];
      };

      "hwt-wsl-nixos" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./profiles/hwt-wsl-nixos/home.nix];
      };

      "hwt" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./profiles/rmbp2018EndeavourOS/home.nix];
      };

      "hwt-ubuntu" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./profiles/ubuntu13700KF/home.nix];
      };

      "hwt-wsl-ubuntu" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./profiles/ubuntuWSL13900H/home.nix];
      };

    };

  };

}
