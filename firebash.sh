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


TODAY=`date '+%Y%m%d_%H%M'`;
FILENAME=FirebaseBackup-$TODAY.json

if [[ -z "${DATABASE}" ||  -z "${STORAGE}" ]]; then

        echo "Environment variable not set!"
        echo "Exiting..."

else

	echo "Downloading database...Please wait..."
	curl -s "${DATABASE}.json?print=pretty" >> $FILENAME
	echo "Backup in progress..."
	curl -s -H "Content-Type: text/plain" -X POST -d $FILENAME https://firebasestorage.googleapis.com/v0/b/${STORAGE}/o/${FILENAME} >> /dev/null

fi
