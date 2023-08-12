#-----------------------------------------------------------
# @file
# bulse.sh
#
# @brief
# dotfiles配下のファイルを片っ端から抹消します
#
# @usage
# dotfilesの定期的なメンテで一括して消したい場合に使います
#
# @author
# YamaKen
#
# @created
# 2022.08.16
#-----------------------------------------------------------

# 警告文
MESSAGE="Warning!!
あなたが今唱えようとしている呪文は、dotfiles配下のすべてのファイルを抹消します。
それでもあなたはこの呪文を唱えますか？(y/n): "

#--------------------------------------------
# dotfiles以下のファイルを片っ端から抹消する
#--------------------------------------------
function exec_bulse() {
    # 抹消したくないファイルはこちらへ
    ignore_list=(
        "README.md"
        ".git"
        "bulse.sh"
    )

    # バルスコマンド
    bulse="ls -a"

    # grepコマンドで抹消しないファイルを避ける
    for item in "${ignore_list[@]}" ; do 
        bulse+=" | grep -v ${item}"
    done

    bulse+=" | xargs rm -rf"

    # 解放!!
    echo "Bulse!!"

    # 雰囲気演出のためスリープ
    sleep 2

    eval "${bulse}"
}

# 実行前に同意を求める
read -p "${MESSAGE}" YN

if [ "${YN}" == "y" ] || [ "${YN}" == "Y" ]; then
    # 呪文発動
    exec_bulse
else
    echo "思いとどまったのね。偉いわ。"
fi
