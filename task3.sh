#!/bin/bash

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
