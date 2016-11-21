#!/bin/bash

# define name of log file
log=`date +"%m_%d_%Y"`.log

# get path of run.sh
script_path="$(dirname "$(readlink -f "$0")")"

# change directory
cd $script_path

# create new log entry
mkdir -p logs
echo -e "\n*** HARVEST STARTED ON $(date) ***\n" | tee -a ./logs/$log

# iterate through archives.txt and harvest each archive id
while read line
do
	if [[ $line =~ ^[^#[:blank:]] ]]; then
		php harvest.php $line verbose | tee -a ./logs/$log
	fi
done < archives.txt

