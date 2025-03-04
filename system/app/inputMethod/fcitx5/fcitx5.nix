{ config, pkgs, ... }:

{

  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-chinese-addons
      fcitx5-gtk
      fcitx5-nord
      fcitx5-rime
      fcitx5-material-color
      fcitx5-configtool
      # libsForQt5.fcitx5-qt
      rime-data
    ];
  };

}
