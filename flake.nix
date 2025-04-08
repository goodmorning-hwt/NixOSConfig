{

  description = "My First Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    daeuniverse.url = "github:daeuniverse/flake.nix";
    hydenix = {
      # Available inputs:
      # Main: github:richen604/hydenix
      # Dev: github:richen604/hydenix/dev
      # Commit: github:richen604/hydenix/<commit-hash>
      # Version: github:richen604/hydenix/v1.0.0
      url = "github:goodmorning-hwt/hydenix";
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
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      # pkgs = nixpkgs.legacyPackages.${system};
      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      hydenixConfig = inputs.hydenix.lib.mkConfig {
        userConfig = import ./profiles/hwt-nixos/hyde-cfg.nix;
        extraInputs = inputs;
        # Pass user's pkgs to be used alongside hydenix's pkgs (eg. userPkgs.kitty)
        extraPkgs = pkgs;
      };

    in
    {

      nixosConfigurations."hwt-nixos" = hydenixConfig.nixosConfiguration;

      nixosConfigurations = {
        "goodmorninghwt" = lib.nixosSystem {
          # system = "x86_64-linux";
          inherit system;
          modules = [ ./profiles/nixos/configuration.nix ];
        };

        "hwt-wsl-nixos" = lib.nixosSystem {
          inherit system;
          modules = [
            ./profiles/hwt-wsl-nixos/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.hwt-wsl-nixos = import ./profiles/hwt-wsl-nixos/home.nix;

              # 使用 home-manager.extraSpecialArgs 自定义传递给 ./home.nix 的参数
              # 取消注释下面这一行，就可以在 home.nix 中使用 flake 的所有 inputs 参数了
              # home-manager.extraSpecialArgs = inputs;
            }

          ];
        };

        # "hwt-nixos" = lib.nixosSystem {
        #   inherit system;
        #   specialArgs = { inherit inputs; };
        #   modules = [
        #     inputs.daeuniverse.nixosModules.dae
        #     inputs.daeuniverse.nixosModules.daed
        #     ./profiles/hwt-nixos/configuration.nix
        #     home-manager.nixosModules.home-manager
        #     {
        #       home-manager.useGlobalPkgs = true;
        #       home-manager.useUserPackages = true;
        #       home-manager.users.hwt-nixos = import ./profiles/hwt-nixos/home.nix;

        #       home-manager.extraSpecialArgs = inputs;
        #     }

        #   ];
        # };

      };

      homeConfigurations = {
        "goodmorninghwt" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./profiles/nixos/home.nix ];
        };

        "hwt-wsl-nixos" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./profiles/hwt-wsl-nixos/home.nix ];
        };

        "hwt-nixos" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./profiles/hwt-nixos/home.nix ];
        };

        "hwt" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./profiles/rmbp2018EndeavourOS/home.nix ];
        };

        "hwt-ubuntu" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./profiles/ubuntu13700KF/home.nix ];
        };

        "hwt-wsl-ubt" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./profiles/ubuntuWSL13900H/home.nix ];
        };

        "hwt-sv7-edv" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./profiles/hwt-sv7-edv/home.nix ];
        };

      };

    };

}
