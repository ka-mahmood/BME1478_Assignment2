#!/bin/bash

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

if diff -r assignment-data assignment-data-copy; then
	echo "All files and folder names are the same."
fi