#!/bin/bash

# The purpose of this script is to get the final total energy and dipoles of all .log files
# We grep
# This script fails if the .log files have a different structure than expected

# Greps all the lines with 'total E' and 'full', delete first every second and then every third line
grep -E 'total E|full: ' *.log | sed -n '1~2!p' | sed -n '1~3!p' > Data_Collection.temp

# I still have to make warnings if the output file exists etc....
#Too lazy now

while read p; do
   if [[ $p == *"total E"* ]]; then
       string2=`echo $p | awk '{print $4}'`
   fi
   if [[ $p == *"full:"* ]]; then
       string1=`echo $p | awk '{print $1 $6}'`
   fi
   echo $string1 $string2 | sed 's/:/,/g' | sed 's/ /,/g' >> Data_Collection.csv
done <Data_Collection.temp

sed -i -n '1~2!p' Data_Collection.csv

rm Data_Collection.temp

