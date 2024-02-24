{confi, pkgs, ...}:

{

	home.packages = with pkgs; [
    # vscode

	];

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
  };

  home.file.".vscode/vimrc".source = ./vscode.vim;

}
