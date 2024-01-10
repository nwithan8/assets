#!/bin/bash

# Lints the asset archive against a set of rules assets should abide by

main() {
    LINT_FAILED=0

    # Iterate over each directory and run tests
    for DIR in images/*; do
        for FILE in "$DIR"/*; do
            if ! test_extension; then
                LINT_FAILED=1
            fi
            if ! test_filesize; then
                LINT_FAILED=1
            fi
        done
    done

    # Set exit code based on if the tests passed or failed
    if [ "$LINT_FAILED" == 0 ]; then
        echo "Lint passed!"
        exit 0
    else
        echo "Lint failed!"
        exit 1
    fi
}

# Files must be png, jpg, or gifs
test_extension() {
    if [ "${FILE: -4}" != ".png" ] && [ "${FILE: -4}" != ".jpg" ] && [ "${FILE: -4}" != ".gif" ]; then
        echo "$FILE failed extension test!"
        exit 1
    fi
}

# Files must be smaller than 2mb if images and 5mb if videos/gifs
test_filesize() {
    MAX_IMAGE_FILESIZE_BYTES=2000000
    MAX_VIDEO_FILESIZE_BYTES=5000000
    FILESIZE_BYTES=$(wc -c "$FILE" | awk '{print $1}')
    if [ "$FILESIZE_BYTES" -gt "$MAX_VIDEO_FILESIZE_BYTES" ] && [ "${FILE: -4}" == ".gif" ]; then
        echo "$FILE is larger than the max filesize ($MAX_VIDEO_FILESIZE_BYTES) at $FILESIZE_BYTES bytes."
        return 1
    elif [ "$FILESIZE_BYTES" -gt "$MAX_IMAGE_FILESIZE_BYTES" ] && [ "${FILE: -4}" != ".gif" ]; then
        echo "$FILE is larger than the max filesize ($MAX_IMAGE_FILESIZE_BYTES) at $FILESIZE_BYTES bytes."
        return 1
    fi
}

main
