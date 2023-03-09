#!/bin/bash

# Prevent multiple instances of the script from being run.
lockfile="lockfile.tmp"
if [ -f "$lockfile" ]; then
        exit
fi
touch "$lockfile"



# Generate Subtitles
find . -maxdepth 1 -regex ".*.wav" | while read file_path; do
	./whisper.cpp/main -l auto -tr -osrt --model ./ggml-model.bin -f "$file_path"
	rm "$file_path"
done



rm $lockfile
