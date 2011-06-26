#!/bin/bash

REPOSITORY="https://github.com/ivadla/dominion-images"

if test $# -ne 1 ; then
	echo "Usage $0 <jpg directory of the card repository>"
fi

cd "$1"
subdirectory=""
find |sort | while read file
do
	if test "$file" != "." ; then
		file=${file#./}
		if test -d "$file" ; then
#			subdirectory="$file"		
			echo "<h1>${file^}</h1>"
		else
			echo '<a href="'$REPOSITORY'/blob/master/png/'${file%jpg}png'"><img src="'$REPOSITORY/raw/master/jpg/$file'" /></a>'
		fi
	fi
done
