#!/bin/bash

# Prevent multiple instances of the script from being run.
lockfile="lockfile.tmp"
if [ -f "$lockfile" ]; then
        exit
fi
touch "$lockfile"



# Extract first audio track of each file.
extensions=( "avi" "divx" "flx" "m2ts" "m4v" "mkv" "mov" "mp4" "mpg" "ts" "webm" "wmv" )
for extension in "${extensions[@]}"
do
	find . -maxdepth 1 -regex ".*$extension" | while read file_path; do
		ffmpeg -nostdin -i "$file_path" -c:a pcm_s16le -ar 16000 "$file_path.wav" -y
	done
done



rm $lockfile
