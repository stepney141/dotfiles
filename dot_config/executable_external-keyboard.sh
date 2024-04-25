#!/bin/bash

# ref: https://socinuit.hatenablog.com/entry/2021/04/12/194516

keyboard_name="keyboard:NuPhy Air75 V2-1 Keyboard"

while :
do
    keyboard_id=$(xinput list --id-only "$keyboard_name")
    setxkbmap -device "$keyboard_id" -layout us
    sleep 1
done

