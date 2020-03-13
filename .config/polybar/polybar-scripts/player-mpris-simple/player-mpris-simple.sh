
#!/bin/sh

# Determine player status
player_status=$(playerctl status 2> /dev/null)

# Update icon according to player status
if [ "$player_status" = "Playing" ]; then
  status_icon="▶  "
elif [ "$player_status" = "Paused" ]; then
  status_icon="⏸  "
else
  exit 1;
fi

# Determine metadata to be displayed
if [ "$(playerctl metadata artist)" = "" ]; then
  player_metadata="$(playerctl metadata title)"
else
  player_metadata="$(playerctl metadata artist) - $(playerctl metadata title)"
fi

# Print output
echo "$status_icon $player_metadata"

# if [ "$player_status" = "Playing" ]; then
#   if [ "$(playerctl metadata artist)" = "" ]; then
#     echo "$status_icon $(playerctl metadata title)"
#   else
#     echo "#1 $(playerctl metadata artist) - $(playerctl metadata title)"
#   fi
# elif [ "$player_status" = "Paused" ]; then
#   echo "$status_icon $(playerctl metadata artist) - $(playerctl metadata title)"
# else
#   echo "#3"
# fi
