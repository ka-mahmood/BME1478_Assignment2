#!/bin/bash

echo -------------------- PART ONE --------------------
echo The script is placed in the folder titled "assignment2-data", one directory above assigment-data.

echo Making folder titled "IMAGES" in the assignment-data folder.
mkdir ./assignment-data/IMAGES

# Find all .jpg files, rename the files, then copy them to IMAGES
echo Copying .jpg images from all folders.
find ./assignment-data -type f -name *.jpg -exec bash -c '
	for img do
		# echo Copying $(basename $img) from $(dirname $img) and renaming to $(basename $(dirname $img))_$(basename $img).
		cp $img "./assignment-data/IMAGES/$(basename $(dirname $img))_$(basename $img)" 
	done
' -- {} \;


echo Making folder titled "DATA_ANALYSIS" in the assignment-data folder.
mkdir ./assignment-data/DATA_ANALYSIS

echo Copying all files except .jpg from all folders.

# Repeat find command but exclude .jpg files
find ./assignment-data -type f ! -name  *.jpg  -exec bash -c ' # specify -type f to avoid copying directories
	for file do
		# echo Copying $(basename $file) from $(dirname $file) and renaming to $(basename $(dirname $img))_$(basename $img).
		cp $file "./assignment-data/DATA_ANALYSIS/$(basename $(dirname $file))_$(basename $file)" 
	done
' -- {} \;

echo -------------------- PART TWO --------------------
echo "Checking which folders are missing a note file."

# Check all folders for a .txt file; first, loop and find all folders
for folders in ./assignment-data/*; do
	# Now able to see subject folders - check if a .txt file exists

	if find $folders/ -name "*note*" -exec false {} +; then
		echo Folder $folders is missing a note file. 
	fi

done

echo "Checking which folders are missing a demographics file."

# Check all folders for a .txt file; first, loop and find all folders
for folders in ./assignment-data/*; do
	# Now able to see subject folders - check if a .txt file exists

	if find $folders/ -name "*.csv" -exec false {} +; then
		echo Folder $folders is missing a demographic spreadsheet. 
	fi

done

echo -------------------- PART THREE --------------------
echo Renaming all note files to notes.txt

# Rename all the files containing "note" to "notes.txt"
find ./assignment-data -name "*note*" -exec bash -c '
	for file do
		mv $file $(dirname $file)/notes.txt
	done
' -- {} \;

echo -------------------- PART FOUR --------------------
echo Checking that assignment-data folder is intact