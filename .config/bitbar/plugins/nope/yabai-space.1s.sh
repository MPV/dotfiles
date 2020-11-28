#!/bin/bash

yabai=/usr/local/bin/yabai
jq=/usr/local/bin/jq

echo "$($yabai -m query --spaces --display | $jq 'map(select(."focused" == 1))[-1].index'):$($yabai -m query --spaces --display | $jq -r 'map(select(."focused" == 1))[-1].type') | length=5"
