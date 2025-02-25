{config, pkgs, ...}:

{
	home.packages = with pkgs; [
		git
		neovim
		# == c comilers ==
		gnumake
		gcc
		zig
		# == copilot chat ==
		lynx
		# == tree-sitter ==
		tree-sitter
		fd
		ripgrep
		ripgrep-all
		# == lua ==
		lua
		lua-language-server
		rust-analyzer-unwrapped
		black
		gh
		nodejs_22
	];

}


