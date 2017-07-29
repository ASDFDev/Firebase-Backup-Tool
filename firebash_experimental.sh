#!/bin/bash


#Copyright 2017 ASDF Dev

#FBT is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.

#FBT is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.


#Note: This script is not feature complete yet! Instead, use firebash.sh for your backup needs.

OPTIONS=$(whiptail --title "Firebase Backup Tool" --menu "" 15 60 4 \
"1" "Backup Data" \
"2" "Restore Data" 3>&1 1>&2 2>&3)
TODAY=`date '+%Y%m%d_%H%M'`;
FILENAME=FirebaseBackup-$TODAY.json
: ${DATABASE?"Need to set Database URL"}
: ${STORAGE:?"Need to set Storage URL"}
userOptions=$?

if [ "$userOptions" = 0 ]; then
	reset
	if [ "$OPTIONS" = 1 ]; then
              {
		for ((i=0; i<=100; i+=20)); do
		curl -s "${DATABASE}.json?print=pretty" >> $FILENAME
		curl -s -H "Content-Type: text/plain" -X POST -d $FILENAME https://firebasestorage.googleapis.com/v0/b/${STORAGE}/o/${FILENAME} >> /dev/null
		echo $i
		done
	      } | whiptail --gauge "Backup in progress..." 6 60 0
		whiptail --title "Success" --msgbox "File downloaded at $FILENAME" 8 78
	else
		echo "Restoring..."
		echo "This feature does not work yet..."
	fi
else
	echo "Program exiting..."
fi


