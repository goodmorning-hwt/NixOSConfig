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
        modules = [ ./profiles/hwt-wsl-nixos/configuration.nix
                      home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # 这里的 ryan 也得替换成你的用户名
            # 这里的 import 函数在前面 Nix 语法中介绍过了，不再赘述
            home-manager.users.hwt-wsl-nixos = import ./profiles/hwt-wsl-nixos/home.nix;

            # 使用 home-manager.extraSpecialArgs 自定义传递给 ./home.nix 的参数
            # 取消注释下面这一行，就可以在 home.nix 中使用 flake 的所有 inputs 参数了
            # home-manager.extraSpecialArgs = inputs;
          }

        ];
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
