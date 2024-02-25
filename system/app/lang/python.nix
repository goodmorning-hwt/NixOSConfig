{config, pkgs, ...}:

{
	home.packages = with pkgs; [
		python3
    python310Packages.pip
    python310Packages.pip-tools
    python310Packages.jupyter
    conda
	];



}
