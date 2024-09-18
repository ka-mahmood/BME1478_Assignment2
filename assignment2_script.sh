#!/bin/bash

bash task1.sh
bash task2.sh
bash task3.sh
bash task4.sh
bash task5.sh

echo -------------------- PART THREE --------------------
echo Renaming all note files to notes.txt

# Rename all the files containing "note" to "notes.txt"
find ./assignment-data -name "*note*" -exec bash -c '
	for file do
		mv $file $(dirname $file)/notes.txt
	done
' -- {} \;

echo -------------------- PART FOUR --------------------
echo Checking that assignment-data folder is intact:
echo To compare folders, you can use the "diff" command. 
echo This is used in the form "diff {option} ... {path 1} {path 2}". \
	It compares the contents of the path - if given a directory path, it compares \
	to the first depth by default: "diff assignment-data assignment-data-copy" will only \
	compare the names of folders under assignment-data. If any of the files within the \
	folders are missing, then "diff" will not output a difference. The file names will \
	have to be changed to those that are of the hard drive folder and the main computer. 

echo Some of the options include "-r" for recursive, "-i" to ignore case, and "-y" to show \
	a side-by-side comparison. The following is the output of \
	"diff assignment-data assignment-data-copy:"

diff assignment-data assignment-data-copy


echo -------------------- PART FIVE --------------------
echo Number of occurences of the word "photo" in all files within all directories \
	under assignment-data:
grep -o -r 'photo' assignment-data | wc -l