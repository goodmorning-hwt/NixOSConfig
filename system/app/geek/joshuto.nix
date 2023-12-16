{config, pkgs, ...}:

{
	home.packages = with pkgs; [
	# My Hyperland Packages
		joshuto
		cargo
		rustc
		xclip
		fzf
		zoxide
	];



	programs.joshuto = {
		enable = true;
		theme = {
		};
	};

	

  
}
