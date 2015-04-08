#!/bin/sh

addonLink=$1

# move to config-file
tmpPath="tmp"

dwnlist="$tmpPath/_nc_downloadlist"
unziplist="$tmpPath/_nc_unziplist"


if [ "$addonLink" = "" ]; then
	echo "204 - Missing parameter (nc_download <addonLink>"			# No content! (missing parameter)
else
	addonZipName=$(basename $addonLink)

	wget -q -O "$tmpPath/$addonZipName" $addonLink

	if [ -f "$tmpPath/$addonZipName" ]; then
		echo " *   Downloaded $addonZipName"
		echo "$addonZipName" >> $unziplist
	else
		echo " *   ERROR: $addonZipName wasn't downloaded!"
	fi
fi

