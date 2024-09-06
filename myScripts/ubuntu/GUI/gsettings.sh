#!/bin/bash

# 定义备份文件路径
backup_file="./backUpFiles/gsettings_backup.txt"

# 检查备份文件是否存在
if [ -f "$backup_file" ]; then
    # 从备份文件中读取设置并应用到系统中
    while IFS= read -r line; do
        gsettings set $line
    done < "$backup_file"
    
    echo "gsettings已成功恢复。"
else
    echo "备份文件 $backup_file 不存在。无法恢复gsettings设置。"
fi


echo "gsettings in：$backup_file"
