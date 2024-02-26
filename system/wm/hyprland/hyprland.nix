{confi, pkgs, ...}:

{

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;
  };

  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind =
      [
        "$mod, F, exec, firefox"
        ", Print, exec, grimblast copy area"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );
  };


	home.packages = with pkgs; [
    # hypr
    # hyprland
    dunst
    waybar
    wofi
    wofi-emoji
    swww
    swaylock
    wlogout
    grimblast
    slurp
    swappy
    cliphist

    # login


    # dependency
    polkit-kde-agent
    xdg-desktop-portal-hyprland
    parallel
    jq
    imagemagick
    qt6.qtimageformats
    ffmpegthumbs
    kde-cli-tools
    brightnessctl
    pavucontrol
    pamixer

    # theme
    nwg-look
    libsForQt5.qtstyleplugin-kvantum
    qt5ct

    # apps
    ark
    dolphin

	];

  services.cliphist = {
    enable = true;
  };


#  programs.hyprland = {
#    enable = true;
#  };

  programs.wlogout = {
    enable = true;
  };

  services.dunst = {
    enable = true;

  };

  programs.waybar = {
    enable = true;
     
  };

  programs.swaylock = {
    enable = true;
     
  };
  programs.wofi = {
    enable = true;
     
  };


}
