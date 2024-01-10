#!/bin/bash

# Create a non-WEBP version of each image in the current directory.
# Requires dwebp (https://developers.google.com/speed/webp/download) to be installed.

TARGET_FORMAT=${1:-png}

# Find all image files in the current directory
IMAGE_SUFFIXES=(.webp .WEBP)
IMAGE_FIND_COMMAND="find . -maxdepth 1 -type f"
for suffix in "${IMAGE_SUFFIXES[@]}"; do
  IMAGE_FIND_COMMAND+=" -o -name \"*${suffix}\""
done

IMAGE_FILES=($(eval $IMAGE_FIND_COMMAND))

# Convert each image to different format
for image in "${IMAGE_FILES[@]}"; do
  dwebp "$image" -o "${image%.*}.$TARGET_FORMAT"
done
