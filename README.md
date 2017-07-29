# FBT

**F**irebase **B**ackup **T**ool

Background
-----------
As of writing, Firebase daily backup service is unavailable in free tier. This tool
utilizes Firebase REST APIs to read the entire database node and save them in 
Firebase storage service and your local hard disk. 


Usage
-------

Prerequisites: Ensure you export Firebase database and Firebase storage URL in your .bashrc. 


Example:


`export DATABASE=https://<YOUR URL HERE>.firebaseio.com/`

`export STORAGE=<YOUR URL HERE>.appspot.com`


Simply call `./firebash.sh` (ensure you have executable permission)

To do daily backup at 0100, add this in your crontab.

`0 1 * * * /path/to/firebash.sh`

To do a backup every wednesday at 0100, add this

`0 1 * * 3 /path/to/firebash.sh`

 
