{

  description = "My First Flake";

  inputs = {
    # nixpkgs = {
    #  url = "github:NixOS/nixpkgs/nixos-23.11";
    # };
     nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
     home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {


    homeConfigurations = {
      "goodmorninghwt" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./profiles/nixos/home.nix];
      };

      "hwt" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        # modules = [ ./profiles/nixos/home.nix];
        modules = [ ./profiles/rmbp2018EndeavourOS/home.nix];
      };
    };

  };

}
