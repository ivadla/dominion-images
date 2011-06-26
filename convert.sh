#!/bin/bash

find svg/ -type f -name "*.svg" | while read svgFile
do
	pngFile="${svgFile//svg/png}"
	pngDir=` dirname "$pngFile"`
	mkdir -p "$pngDir"
	if test \( '!' \( -e "$pngFile" \) \) || test \( "$svgFile" -nt "$pngFile" \)  ; then
		inkscape "$svgFile" -w 633 -e "$pngFile"
	fi

	jpgFile="${svgFile//svg/jpg}"
        jpgDir=` dirname "$jpgFile"`
        mkdir -p "$jpgDir"
	if test \( '!' \( -e "$jpgFile" \) \) || test \( "$svgFile" -nt "$jpgFile" \)  ; then
		echo "Converting $pngFile to $jpgFile"
		convert "$pngFile" -resize "211x330" -quality 95 "$jpgFile"
	fi
done
