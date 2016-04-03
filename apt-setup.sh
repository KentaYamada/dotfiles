

# aptを最新版にする
sudo apt-get update && upgrade
if [ $? !=0 ]; then
    echo "apt update error."
    exit
fi


# インストールソフト一覧
pkg_list = (sqlite3 pip3)


# 順番にインストールしていく
for pkg in $pkg_list
do
    sudo apt-get install pkg
done


