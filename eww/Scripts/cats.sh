#!/bin/bash

INTERVAL=60   # seconds between cats

CATS=(
'=^.^='
'ฅ^•ﻌ•^ฅ'
'(=^-ω-^=)'
'(=①ω①=)'
'(=ＴェＴ=)'
'(=｀ェ´=)'
'(=ↀωↀ=)'
'(=･ｪ･=)'
'(=；ェ；=)'
'(=ʘᆽʘ=)'
'(=^･^=)'
'(=^-ω-^=)'
':3'
'/ᐠ｡‸｡ᐟ\\'
'(=✪ x ✪=)'
'／(=✪ x ✪=)＼'
'Oh Well'
'Arch BTW!'
'Burin je gej'
'GG'
)

while true; do
    i=$(( RANDOM % ${#CATS[@]} ))
    echo "${CATS[$i]}"
    sleep "$INTERVAL"
done

