{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    go
    gotools
    gopls
    golangci-lint
    gotests
    reftools
    gomodifytags
    # godoctor
    gopkgs
    impl
    godef
  ];

}
