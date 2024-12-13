#!/bin/bash
 
if [ -z "$1" ]; then
  echo "Incorrect input"
  exit 1
fi

source_dir="$1"
log_file="backup.log"
current_date=$(date +"%Y%m%d")
file_count=0

dest_dir="${source_dir}_backup_${current_date}"
mkdir -p "$dest_dir"

echo '' > "$log_file"

for file in "$source_dir"/*; do
  if [ -f "$file" ]; then
    file_name=$(basename "$file")
    cp "$file" "$dest_dir/${file_name}_${current_date}"
    echo "Saved $file_name to $dest_dir/${file_name}_${current_date}" >> "$log_file"
    ((file_count++))
  fi
done

echo "Reserved copying Files saved: $file_count."
echo "Detailes saved to $log_file."