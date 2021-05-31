#!/bin/bash

### A simple shell script to wallpapers using feh. Additionally checks and sets
### a wallpaper that hasn't been set before.

WALL_DIR="/home/athul/.wallpapers"
WALL_LIST="/home/athul/.wallpapers/.used_wall.txt"


# Check if the file is present; otherwise create it
if [ ! -e $WALL_LIST ]
then
    touch $WALL_LIST
fi

# Check if all the wallpapers have been used.
if [ 0 -eq $(cat $WALL_LIST | wc -l) ]
then
    (ls $WALL_DIR | sort -R ) > $WALL_LIST
fi
cat $WALL_LIST|tail -n1
# Set the wallpaper. Add it to the used list.
feh --bg-scale $WALL_DIR/$(cat $WALL_LIST|tail -n1)
sed -i "$ d" $WALL_LIST
