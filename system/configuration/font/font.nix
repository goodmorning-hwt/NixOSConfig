{ config, pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      ubuntu_font_family
      liberation_ttf
      # Persian Font
      vazir-fonts

      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      nerd-fonts._0xproto
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      nerd-fonts.caskaydia-cove
      nerd-fonts.caskaydia-mono
      nerd-fonts.mononoki
    ];

    fontconfig = {
      defaultFonts = {
        serif = [
          "Liberation Serif"
          "Vazirmatn"
        ];
        sansSerif = [
          "Ubuntu"
          "Vazirmatn"
        ];
        monospace = [ "Ubuntu Mono" ];
      };
    };
  };

  environment.systemPackages = with pkgs; [
    # fontmatrix
    fontconfig
  ];
}
