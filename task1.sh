#!/bin/bash

# TASK 1

echo -------------------- PART ONE --------------------
echo The script is placed in the folder titled "assignment2-data", one directory above assigment-data.

echo Making folder titled "IMAGES" in the assignment-data folder.
mkdir ./assignment-data/IMAGES

# Find all .jpg files, rename the files, then copy them to IMAGES
echo Copying .jpg images from all folders.
find ./assignment-data -path ./assignment-data/IMAGES -prune -o -type f -name *.jpg -exec bash -c '
	for img do
		# echo Copying $(basename $img) from $(dirname $img) and renaming to $(basename $(dirname $img))_$(basename $img).
		cp $img "./assignment-data/IMAGES/$(basename $(dirname $img))_$(basename $img)" 
	done
' -- {} \;


echo Making folder titled "DATA_ANALYSIS" in the assignment-data folder.
mkdir ./assignment-data/DATA_ANALYSIS

echo Copying all files except .jpg from all folders.

# Repeat find command but exclude .jpg files
find ./assignment-data -path ./assignment-data/DATA_ANALYSIS -prune -o -type f ! -name  *.jpg  -exec bash -c ' # specify -type f to avoid copying directories
	for file do
		# echo Copying $(basename $file) from $(dirname $file) and renaming to $(basename $(dirname $img))_$(basename $img).
		cp $file "./assignment-data/DATA_ANALYSIS/$(basename $(dirname $file))_$(basename $file)" 
	done
' -- {} \;