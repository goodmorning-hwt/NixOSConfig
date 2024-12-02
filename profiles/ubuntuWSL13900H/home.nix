{ config, pkgs, callPackage ,... }:

{
  imports = [
	# Each time before you import, you should stage your file.

    ../../system/app/shell/sh.nix
    ../../system/app/editor/vim/vim.nix

    ../../system/app/geek/lazygit.nix
    # ../../system/app/geek/toys.nix
    # ../../system/app/geek/autojump.nix
    ../../system/app/geek/joshuto/joshuto.nix

    ../../system/app/others/PDFReader/zathura.nix

    ../../system/app/others/downloader/motrix/motrix.nix

    # ../../system/app/Git/git.nix

    # ../../system/app/inputMethod/ibus/ibus.nix
    # ../../system/app/inputMethod/fcitx5/fcitx5.nix
    # ../../system/app/inputMethod/rime/rime.nix

    # ../../system/app/lang/python.nix
    # ../../system/app/lang/go.nix

    ../../system/app/shell/zsh/zsh.nix
    ../../system/app/shell/sh.nix

    ../../system/app/development/direnv.nix


  # Priority
	/*
	lib.mkDefault 50 priority This is the Default Value I want to use but if something is declared somewhere else, use that
	value : 100 priority
	lib.mkOverride somevalue  specific priority
  lib.mkForce

	same attribute set automatically merge
	*/
	];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "hwt-wsl-ubuntu";
  home.homeDirectory = "/home/hwt-wsl-ubuntu";
  nixpkgs.config.allowUnfree = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
		ranger
    hello
		wget
		curl
		vim
		unzip
		zip
		foliate
		tdesktop
		figlet
		meld
    diff-so-fancy
		neovim
		aria2
		emacs29-pgtk
		guile

		gitleaks
		license_finder

    latex2html
		skopeo
		wakatime

    nixpkgs-fmt
		ripgrep


    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/goodmorninghwt/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
    EDITOR = "vim";
  };


  # home.file.".config/hypr/hyprland.conf".text = ''
  #   something nice;
  # ''

  # # Or
  # home.file.".config/hypr/hyprland.conf".source = some relative path

  /* Some Notes:
    sudo nixos-rebuild switch --flake .#goodmorninghwt
    home-manager switch --flake . (~/.dotfiles)

    Search Tips:
    Personal Configs: home-manager(home.nix)
    system level Configs: nixpkgs/option(configuration.nix)

    How To Rollback:
    home-manager generations
    copy-the-listed-path/activate
  */
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;


}
