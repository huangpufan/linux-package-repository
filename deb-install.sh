# 找到当前目录下所有的 .deb 文件并通过 dpkg 安装
for deb in ./deb/*.deb; do
    if [[ -f "$deb" ]]; then
        echo "Installing $deb"
        sudo dpkg -i "$deb"
        # 如果 dpkg 有依赖问题，尝试解决它们
        sudo apt-get -f install
    else
        echo "No .deb files found."
        exit 1
    fi
done

echo "All .deb files have been installed."
