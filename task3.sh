#!/bin/bash

# TASK 3

echo -------------------- PART THREE --------------------
echo Renaming all note files to notes.txt

# Rename all the files containing "note" to "notes.txt"
find ./assignment-data -name "*note*" -exec bash -c '
	for file do
		mv $file $(dirname $file)/notes.txt
	done
' -- {} \;
