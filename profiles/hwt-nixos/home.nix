{
  config,
  pkgs,
  callPackage,
  inputs,
  ...
}:

{
  imports = [
    # Each time before you import, you should stage your file.

    ../../system/app/shell/sh.nix
    ../../system/app/editor/vim/vim.nix
    ../../system/app/editor/spacemacs/spacemacs.nix

    ../../system/app/geek/lazygit.nix
    ../../system/app/geek/joshuto/joshuto.nix

    ../../system/app/others/PDFReader/zathura.nix

    ../../system/app/others/downloader/motrix/motrix.nix

    # ../../system/app/lang/python.nix
    ../../system/app/lang/go.nix
    ../../system/app/lang/shell_scripts.nix
    ../../system/app/lang/latex.nix

    # ../../system/app/terminal/kitty/kitty.nix
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
  home.username = "hwt-nixos";
  home.homeDirectory = "/home/hwt-nixos";
  # nixpkgs.config.allowUnfree = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # ==== toys ====
    ranger
    yazi
    hello
    wget
    curl
    vim
    unzip
    zip
    figlet
    meld
    diff-so-fancy
    # ==== Download
    aria2
    # ==== SNS ====
    tdesktop
    feishu
    # discord
    # ==== e-book reader ====
    foliate
    zathura
    # ==== video player ====
    vlc

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
    ".config/hypr/userprefs.conf" = {
      source = ./hyde-userprefs.conf;
      force = true;
      mutable = true;
    };

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
    # EDITOR = "vim";
  };

  /*
    Some Notes:
    sudo nixos-rebuild switch --flake ~/.dotfiles#hwt-nixos --impure
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
