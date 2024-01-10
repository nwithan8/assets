#!/bin/bash

# Create a WEBP version of each image in the current directory.
# Requires cwebp (https://developers.google.com/speed/webp/download) to be installed.

# Find all image files in the current directory
IMAGE_SUFFIXES=(.jpg .jpeg .png .gif .JPG .JPEG .PNG .GIF)

IMAGE_FIND_COMMAND="find . -maxdepth 1 -type f"
for suffix in "${IMAGE_SUFFIXES[@]}"; do
  IMAGE_FIND_COMMAND+=" -o -name \"*${suffix}\""
done

IMAGE_FILES=($(eval $IMAGE_FIND_COMMAND))

# Convert each image to WEBP
for image in "${IMAGE_FILES[@]}"; do
  cwebp -q 80 "$image" -o "${image%.*}.webp"
done
