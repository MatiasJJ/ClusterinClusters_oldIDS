#!/bin/bash

# The purpose of this script is to get the final total energy and dipoles of all .log files
# We grep
# This script fails if the .log files have a different structure than expected
echo "Give as only input please the folder with your "logs" and "coord" file (if not give already) [ENTER]"
read -p "Press enter to continue"


if [ -e $1/Data_Collection.csv ]; then
        echo "Warning Data_Collection.csv exists and will be overwritten"
        read -p "Press enter to continue"
fi



rm $1/Data_Collection.csv
# Greps all the lines with 'total E' and 'full', delete first every second and then every third line
grep -E 'total E|full: ' $1/logs/*.log | sed -n '1~2!p' | sed -n '1~3!p' > $1/Data_Collection.temp

# I still have to make warnings if the output file exists etc....
#Too lazy now
#path=`pwd`
pathToLogs="./Data1/logs/"
pathToCoords="./Data1/coord/"
header="Filename,LogPath,XYZPath,Dipole,Energy"


echo $header >> $1/Data_Collection.csv
echo $header >> $1/Data_Collection.csv

while read p; do
   if [[ $p == *"total E"* ]]; then
       string2=`echo $p | awk '{print $4}'`
   fi
   if [[ $p == *"full:"* ]]; then
       string1=`echo $p | awk '{print $6}'`
   fi
   filename=`echo $p | awk '{print $1}'`
   dipolesNEnergies=`echo $string1 $string2 | sed 's/:/,/g' | sed 's/ /,/g'`
   filename=`echo "${filename##*/}"`  # Here I take my filenumber
   filename=`echo "${filename%.*}"`
   echo $filename","$pathToLogs$filename".log,"$pathToCoords$filename".xyz,"$dipolesNEnergies >> $1/Data_Collection.csv


done <$1/Data_Collection.temp

sed -i -n '1~2!p' $1/Data_Collection.csv

rm $1/Data_Collection.temp
echo "Done"
