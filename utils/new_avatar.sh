#!/bin/bash

# Create a new avatar image from a given image
# Requires imagemagick to be installed

# Check if the required command is available
if ! command -v magick &> /dev/null; then
    echo "Error: imagemagick is required to run this script"
    exit 1
fi

# Check if an image file and name are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <image_file> <name>"
    exit 1
fi

# Check if the provided file exists
if [ ! -f "$1" ]; then
    echo "Error: File not found"
    exit 1
fi

SOURCE_IMAGE="$1"
NAME="$2"

SIZES=(16 32 48 50 64 96 100 128 200 256 300 400)

OUTPUT_DIR="avatar/$NAME"

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Create avatar images of different sizes
for size in "${SIZES[@]}"; do
    magick "$SOURCE_IMAGE" -resize "${size}x${size}" "$OUTPUT_DIR/${NAME}_${size}.png"
done

# Make WEBP versions of the avatar images
for size in "${SIZES[@]}"; do
    magick "$OUTPUT_DIR/${NAME}_${size}.png" "$OUTPUT_DIR/${NAME}_${size}.webp"
done
