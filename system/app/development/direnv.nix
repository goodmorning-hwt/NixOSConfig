{ pkgs, ... }:

{
  home.packages = with pkgs; [
    direnv
    # 你其他的包...
  ];

  # 如果你想自动启用 direnv，可以添加以下内容
  programs.direnv = {
    enable = true;
    enableZshIntegration = true; # 如果你使用 Zsh
    enableBashIntegration = true; # 如果你使用 Bash
  };
}
