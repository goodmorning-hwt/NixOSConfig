
#!/bin/bash

# 定义要安装的软件包列表

 packages=(
     fcitx5
     fcitx5-frontend-qt5
     fcitx5-frontend-gtk3
     fcitx5-front
     fcitx5-rime

     warp-terminal
     synology-drive
     sunloginclient
 # 在此添加更多软件包
 )

# 更新apt软件包索引
sudo apt update

# 安装软件包
for package in "${packages[@]}"; do
    sudo apt install -y "$package"
done

echo "Installed"

