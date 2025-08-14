#!/bin/bash
# ================================
# IT Troubleshooting Script: Clear Temp Files
# Author: Naawal Mohamed
# Description: Deletes temporary files from common Linux temp directories
# ================================

echo "==============================="
echo "CLEAR TEMP FILES SCRIPT"
echo "==============================="

TEMP_FOLDERS=("/tmp/*" "$HOME/.cache/*")

for folder in "${TEMP_FOLDERS[@]}"
do
    echo "Clearing: $folder"
    rm -rf $folder 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "Cleared successfully."
    else
        echo "Failed to clear: $folder"
    fi
done

echo "==============================="
echo "TEMP FILE CLEANUP COMPLETE"
echo "==============================="
