## Installation

All of these scripts assume that you have followed [my guide](https://www.valkryst.com/posts/42). These scripts should be places alongside the `whisper`, `whisper-large-v2`, and `whisper.cpp` repository folders.

To download this script and its dependencies, copy and paste the following commands into your bash terminal.

```shell
# Install Dependencies
sudo apt update
sudo apt install ffmpeg wget



# Download Scripts
sudo wget https://github.com/Valkryst/Whisper_Automations/extract_audio.sh
sudo wget https://github.com/Valkryst/Whisper_Automations/generate_subtitles.sh
sudo wget https://github.com/Valkryst/Whisper_Automations/regenerate_model.sh



# Modify the script permissions to allow them to be run.
sudo chmod +x extract_audio.sh
sudo chmod +x generate_subtitles.sh
sudo chmod +x regenerate_model.sh
```

## Usage

1. If it has been some time since you have pulled the latest `whisper-large-v2` model, you can run `./regenerate_model.sh` to update and regenerate it.
2. Copy your video files into the same directory as the scripts, and run `./extract_audio.sh`. This will extract _only_ the first audio track of each video file in the directory, and it will convert that audio track to a 16kHz _.wav_ file as required by Whisper.
3. Run `./generate_subtitles.sh` to generate an `.srt` file for each of the `.wav` files. This may take a significant amount of time.

## Notes

* The `generate_subtitles.sh` script will attempt to automatically detect the source file's language and, if necessary, translate it to English.
* The subtitles will never be perfect, but they do seem to work reasonably well.
