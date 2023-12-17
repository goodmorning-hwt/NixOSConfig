{config, pkgs, ...}:

{
	home.packages = with pkgs; [
	  v2ray
		v2raya
	  qv2ray
	];

#	services.v2ray = {
#   enable = true;
#	};

#	services.v2raya = {
#		enable = true;
#	};

  
}
