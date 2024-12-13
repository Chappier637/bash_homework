#!/bin/bash 

if [ -z "$1" ]; then
    echo "Usage $0 directory"
    exit 1
fi

SOURCE_DIR="$1"

IMAGES_DIR="$SOURCE_DIR/Images"
DOCUMENTS_DIR="$SOURCE_DIR/Documents"

LOG_FILE="$SOURCE_DIR/auto_sort.log"

mkdir -p "$IMAGES_DIR"
mkdir -p "$DOCUMENTS_DIR"

echo "File sorting starts: $(date)" >> "$LOG_FILE"

for file in "$SOURCE_DIR"/*; do
    if [ -f "$file" ]; then
        case "${file,,}" in
            *.jpg|*.png|*.gif)
                mv "$file" "$IMAGES_DIR"
                echo "Moving $file to $IMAGES_DIR" >> "$LOG_FILE"
                ;;
            *.txt|*.pdf|*.docx)
                mv "$file" "$DOCUMENTS_DIR"
                echo "Moving $file to $DOCUMENTS_DIR" >> "$LOG_FILE"
                ;;
        esac
    fi
done

echo "File sorting end $(date)" >> "$LOG_FILE"