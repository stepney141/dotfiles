#!/bin/bash

## 外部モニターが接続されていたらデュアルモニター用の設定を適用
## 未接続ならeDP(内蔵ディスプレイ)のみに出力

st_prev="disconnected"
thinkpad_x13_embedded_display="ELAN901C:00 04F3:2FE6"
hdmi_name="HDMI-A-1"

while :
do
    st_next=$(cat /sys/class/drm/*$hdmi_name/status)
    if [ $st_prev != $st_next ]; then
        st_prev=$st_next
        if [ $st_next = "connected" ]; then
            # xrandr --output eDP --primary --mode 1920x1200 --pos 1920x0 --rotate normal --output HDMI-A-0 --mode 1920x1200 --pos 0x0 --rotate normal
            xrandr --output eDP --primary --auto --output $hdmi_name --auto --left-of eDP
        else
            ## 外部ディスプレイを接続していない時の設定
            xrandr --output eDP --primary --mode 1920x1200 --pos 1920x0 --rotate normal --output $hdmi_name --off
        fi
    fi
     xinput --map-to-output $(xinput list --id-only $thinkpad_x13_embedded_display) eDP
    sleep 1
done
