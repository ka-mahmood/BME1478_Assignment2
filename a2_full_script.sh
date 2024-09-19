#!/bin/bash

echo BME1478H Assignment 2 - Ash Mahmood - 09/18/2024
echo The script is placed in the folder titled "assignment2-data", one directory above assigment-data.

# TASK 1

echo -------------------- PART ONE --------------------
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

# TASK 3

echo -------------------- PART THREE --------------------
echo Renaming all note files to notes.txt, except for those under DATA_ANALYSIS as \
    this will cause them to overwrite each other.

# Rename all the files containing "note" to "notes.txt"
find ./assignment-data -name "*note*" -exec bash -c '
	for file do
        if [ $(dirname $file) != "./assignment-data/DATA_ANALYSIS" ]; then
		    mv $file $(dirname $file)/notes.txt
        fi
	done
' -- {} \;

# TASK 4

echo -------------------- PART FOUR --------------------
echo Checking that assignment-data copy is intact. As per TA suggestion, including file and folder comparison:
# echo To compare folders, you can use the "diff" command. 
# echo This is used in the form "diff {option} ... {path 1} {path 2}". \
	# It compares the contents of the path - if given a directory path, it compares \
	# to the first depth by default: "diff assignment-data assignment-data-copy" will only \
	# compare the names of folders under assignment-data. If any of the files within the \
	# folders are missing, then "diff" will not output a difference. The file names will \
	# have to be changed to those that are of the hard drive folder and the main computer. 

# echo Some of the options include "-r" for recursive, "-i" to ignore case, and "-y" to show \
	# a side-by-side comparison. The following is the output of \
	# "diff -r assignment-data assignment-data-copy:", which uses the code 'r' to recursively also \
	# check the files that are missing.

if diff -r assignment-data assignment-data-proper; then
	echo "All file and folder names are the same."
fi

# TASK 5

echo -------------------- PART FIVE --------------------
echo Number of occurences of the word "photo" in all files within all directories \
	under assignment-data:
grep -o -r 'photo' assignment-data | wc -l