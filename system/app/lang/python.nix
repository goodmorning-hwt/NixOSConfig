{config, pkgs, ...}:

{
	home.packages = with pkgs; [
		python311Full
    python311Packages.pip
    python311Packages.pip-tools
    python311Packages.jupyter
    python311Packages.virtualenv
    # python311Packages.conda
	];



}
