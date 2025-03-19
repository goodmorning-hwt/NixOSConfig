{ config, pkgs, ... }:

{
  home.packages = with pkgs; [

    # python312
    python312Packages.pip
    python312Packages.virtualenv
    python312Packages.setuptools
    python312Packages.python-lsp-server
    python312Packages.flake8
    python312Packages.pytest
    python312Packages.debugpy
    python312Packages.isort
    # python312Packages.conda
    # conda
    # micromamba

  ];

}
