#!/bin/bash

# <bitbar.dependencies>bash</bitbar.dependencies>

yabai=/usr/local/bin/yabai
jq=/usr/local/bin/jq

# ---------------------------------------------------------

# retrieve all info about displays
displays=$($yabai -m query --displays)
display_idx=$(echo ${displays} | $jq '.[].index')
#echo "$display_idx"

# retrieve all info about spaces
spaces=$($yabai -m query --spaces --display 1)
spaces_idx=$(echo ${spaces}   | $jq '.[].index')
# space symbols
space_sym=(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)
# determine active space
space_cur=$(echo ${spaces}    | $jq '.[] | select(.visible == 1)')
# extract active space number
space_idx=$(echo ${space_cur} | $jq '.index')
# extract active space layout (remove double quotes -> extract first char -> convert lower to upper
space_lay=$(echo ${space_cur} | $jq '.type' | tr -d '\"' | cut -c 1 | tr '[:lower:]' '[:upper:]')
# extract active space label (remove double quotes)
space_label=$(echo ${space_cur} | $jq '.label' | tr -d '\"' )
# determine total # of spaces
space_all=$(echo ${spaces}    | $jq '. | max_by(.index) | .index')

# ---------------------------------------------------------

# produce output for bitbar

echo "${space_idx} (${space_label})"

echo "---"

#echo "Displays:"
#for display_id in ${display_idx}; do
#	echo "-- ${display_id}"
#done

#echo "${space_lay}⎜${space_sym[$space_idx]}-${space_all} | "
#echo "${space_lay}|${space_idx} ${space_all} "

for space_id in ${spaces_idx}; do
  space=$(echo ${spaces} | $jq ".[] | select(.index == ${space_id})")
  space_label=$(echo ${space} | $jq '.label' | tr -d '\"')
  echo -n "${space_id}"
  echo -n " "
	echo -n "${space_label}"
  #echo -n "|"
  #echo -n "terminal=false "
  #echo -n "bash=$yabai param1=-m param2=space param3=--focus param4=${space_id}"
  echo
  windows=$(echo ${space} | $jq -j '.windows' | tr -d '[' | tr -d ']' | tr -d ',')
	for window_id in ${windows}; do
	  window=$($yabai -m query --windows --window ${window_id})
		window_app=$(echo $window | $jq '.app' | tr -d '\"' )
		window_title=$(echo $window | $jq '.title' | tr -d '\"' )
	  echo -n "--"
    echo -n "${window_app} / ${window_title}"
    echo -n "|"
    echo -n "terminal=false "
    echo -n "bash=$yabai param1=-m param2=window param3=--focus param4=${window_id} "
    echo -n "refresh=true "
    echo
  done
done
