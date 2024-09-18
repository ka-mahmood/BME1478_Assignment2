#!/bin/bash

# TASK 2

echo -------------------- PART TWO --------------------
echo Checking which folders are missing a note file. Note: this excludes the DATA_ANALYSIS and IMAGES folders.

# Check all folders for a .txt file; first, loop and find all folders
for folders in ./assignment-data/*; do
	# Now able to see subject folders - check if a .txt file exists

    if [ "${folders}" != "./assignment-data/DATA_ANALYSIS" ] && [ "${folders}" != "./assignment-data/IMAGES" ]; then
        if find $folders/ -name "*note*" -exec false {} +; then
            echo Folder $folders is missing a note file. 
        fi
    fi

done

echo Checking which folders are missing a demographics file. This excludes the DATA_ANALYSIS and IMAGES folder.

# Check all folders for a .txt file; first, loop and find all folders
for folders in ./assignment-data/*; do
	# Now able to see subject folders - check if a .txt file exists
    # AVOID checking the DATA_ANALYSIS folder
    if [ "${folders}" != "./assignment-data/DATA_ANALYSIS" ] && [ "${folders}" != "./assignment-data/IMAGES" ]; then
        if find $folders/ -name "*.csv" -exec false {} +; then
            echo Folder $folders is missing a demographic spreadsheet. 
        fi
    fi

done