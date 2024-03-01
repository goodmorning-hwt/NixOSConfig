{lib, config, options, pkgs, ...}:
{
  # 导入其他 Modules
  imports = [
    # ......
    # ./xxx.nix
  ];

/*
# 其他声明
	home.packages = with pkgs; [
    # vscode

	];

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
  };

  home.file.".vscode/vimrc".source = ./vscode.vim;
*/
}
