#!/bin/bash

# TASK 5

echo -------------------- PART FIVE --------------------
echo Number of occurences of the word "photo" in all files within all directories \
	under assignment-data:
grep -o -r 'photo' assignment-data | wc -l