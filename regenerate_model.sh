#!/bin/bash

# Prevent multiple instances of the script from being run.
lockfile="lockfile.tmp"
if [ -f "$lockfile" ]; then
        exit
fi
touch "$lockfile"



# Update Sources
cd whisper-large-v3
git pull



# Regenerate Model
cd ../
python3 ./whisper.cpp/models/convert-h5-to-ggml.py ./whisper-large-v3 ./whisper .



rm $lockfile
