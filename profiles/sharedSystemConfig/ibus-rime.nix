{lib, config, options, pkgs, ...}:
{
  # 导入其他 Modules
  imports = [
    # ......
    # ./xxx.nix
  ];

  i18n.inputMethod = {
    # enabled = "fcitx5";
    # fcitx5.addons = with pkgs; [
    #  fcitx5-rime
    #  fcitx5-chinese-addons
    # ];

    # 我现在用 ibus
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
      libpinyin
      rime
    ];
    # rime configuration file is in the system folders
  };

}
