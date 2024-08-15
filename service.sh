#!/system/bin/sh

sleep 180

#游戏列表
gamelist=$(cat gamelist)

_check(){
if [ $? -eq 0 ]; then
    echo "安装完毕！"
else
    echo "安装失败..."
    rm -rf /data/local/tmp/ysya.apk
fi
}

while true; do
sleep 5
#检测更新


#删除magisk标记
rm -rf ../disable* 
rm -rf ../remove*

#好戏
if pm list packages | grep "com.miHoYo.Yuanshen"; then
    echo "原神已安装，正在拦截游戏app启动"
    for ysqd in $gamelist
    
else
    echo "原神未安装，开始安装....."
    if [[ -f /data/local/tmp/ysya.apk ]]; then
       pm install /data/local/tmp/ysya.apk
       _check
    else
       wget --no-check-certificate -O /data/local/tmp/ysya.apk "https://ys-api.mihoyo.com/event/download_porter/link/ys_cn/official/android_default"
       pm install /data/local/tmp/ysya.apk
       _check
    fi
fi
done