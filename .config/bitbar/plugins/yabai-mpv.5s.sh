#!/bin/bash

# <bitbar.dependencies>bash</bitbar.dependencies>

yabai=/usr/local/bin/yabai
jq=/usr/local/bin/jq

all_spaces_objects=$($yabai -m query --spaces --display 1)
all_spaces_ids=$(echo ${all_spaces_objects}   | $jq '.[].index')
#all_spaces_count=$(echo ${all_spaces_objects} | $jq '. | max_by(.index) | .index')

current_space_object=$(echo ${all_spaces_objects} | $jq '.[] | select(.visible == 1)')
current_space_id=$(echo ${current_space_object} | $jq '.index')
current_space_label=$(echo ${current_space_object} | $jq '.label' | tr -d '\"' )

#all_windows=$($yabai -m query --windows)

# Show this:
echo "${current_space_id} (${current_space_label})"

# Submenu:
echo "---"

for space_id in ${all_spaces_ids}; do

  space=$(echo "${all_spaces_objects}" | $jq ".[] | select(.index == ${space_id})")
  space_label=$(echo "${space}" | $jq '.label' | tr -d '\"')

  echo -n "${space_id}"
  echo -n " "
	echo -n "${space_label}"

  echo

  space_windows=$(echo "${space}" | $jq -j '.windows' | tr -d '[' | tr -d ']' | tr -d ',')

  # List windows in submenu:
	for window_id in ${space_windows}; do

	  window=$($yabai -m query --windows --window "${window_id}")
	  #window=$(echo $all_windows | $jq ".[] | select(.id == $window_id)")

		window_app=$(echo "$window" | $jq '.app' | tr -d '\"' )
		window_title=$(echo "$window" | $jq '.title' | tr -d '\"' )

	  echo -n "--"
    echo -n "${window_app}"
	  echo -n " / "
    echo -n "${window_title}"

    # Focus window when clicking:
    echo -n " | "
    echo -n "terminal=false "
    echo -n "bash=$yabai param1=-m param2=window param3=--focus param4=${window_id} "
    echo -n "refresh=true "

    echo

  done
done
