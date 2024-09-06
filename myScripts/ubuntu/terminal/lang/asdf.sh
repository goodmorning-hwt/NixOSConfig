#!/bin/bash

# 安装 asdf
echo "正在安装 asdf..."
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0

# 检查 ~/.dotfiles/myshell.bash 是否存在
if [ ! -f ~/.dotfiles/myshell.bash ]; then
  echo "错误：~/.dotfiles/myshell.bash 文件不存在。请先创建此文件，然后再次运行此脚本。"
  exit 1
fi

# 加载 asdf 到 myshell.bash
echo 'source $HOME/.asdf/asdf.sh' >> ~/.dotfiles/myshell.bash
echo 'source $HOME/.asdf/completions/asdf.bash' >> ~/.dotfiles/myshell.bash
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

# 函数：安装插件和语言版本
install_language() {
  language_name=$1
  plugin_name=$2
  install_command=$3
  post_install_command=$4

  read -p "是否安装 $language_name? (y/n): " install
  if [ "$install" == "y" ]; then
    asdf plugin add $plugin_name
    eval $install_command
    eval $post_install_command
  else
    echo "跳过安装 $language_name."
  fi
}

# 安装 Node.js 和 npm
install_language "Node.js 和 npm" "nodejs" "
  asdf install nodejs 18.16.0 &&
  asdf global nodejs 18.16.0 &&
  echo 'Node.js 和 npm 已安装，版本 18.16.0'
" ""

# 安装 Rust 和 cargo
install_language "Rust 和 cargo" "rust" "
  asdf install rust 1.73.0 &&
  asdf global rust 1.73.0 &&
  echo 'Rust 和 cargo 已安装，版本 1.73.0'
" "
  # 添加 Rust 环境变量到 ~/.dotfiles/myshell.bash
  echo 'source ~/.asdf/installs/rust/1.73.0/env' >> ~/.dotfiles/myshell.bash
  echo 'Rust 环境变量已添加到 ~/.dotfiles/myshell.bash'
"

# 安装 Go
install_language "Go" "golang" "
  asdf install golang 1.20.7 &&
  asdf global golang 1.20.7 &&
  echo 'Go 已安装，版本 1.20.7'
" "
  # 添加 Go 环境变量到 ~/.dotfiles/myshell.bash
  echo 'export PATH=\"\$PATH:\$HOME/.asdf/installs/golang/1.20.7/go/bin\"' >> ~/.dotfiles/myshell.bash
  echo 'Go 环境变量已添加到 ~/.dotfiles/myshell.bash'
"

echo "所有指定语言的安装过程已完成。请确保在你的 ~/.bashrc 或 ~/.zshrc 文件中 source ~/.dotfiles/myshell.bash 以使更改生效。"

