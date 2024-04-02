#!/bin/bash


echo "Installing v2raya..."

wget -qO - https://apt.v2raya.org/key/public-key.asc | sudo tee /etc/apt/keyrings/v2raya.asc

echo "deb [signed-by=/etc/apt/keyrings/v2raya.asc] https://apt.v2raya.org/ v2raya main" | sudo tee /etc/apt/sources.list.d/v2raya.list
sudo apt update
sudo snap install v2ray
sudo snap install v2raya
# sudo apt install v2raya v2ray ## 也可以使用 xray 包

sudo systemctl start v2raya.service
sudo systemctl enable v2raya.service


echo "v2raya installed successfully!"
