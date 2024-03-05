{config, pkgs, ...}:

{
	home.packages = with pkgs; [
		go
    gopls
	];

  programs.go = {
    enable = true;
    goPath = "Documents/SynologyDrive/ItsMyGo";
  };


}
